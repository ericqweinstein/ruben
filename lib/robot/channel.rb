# encoding: UTF-8
# @author Eric Weinstein <eric.q.weinstein@gmail.com>
require_relative 'listener'

# Load all our 'bot's scripts.
Dir[File.dirname(__FILE__) + '/scripts/*.rb'].each { |script| require script }

# Handles communcation with IRC.
module Channel
  PARTING_MESSAGES = ['bye', 'peace!', 'later', 'I\'m out']

  # Sends a message to IRC.
  # @param [String] msg The message to send.
  def send(msg)
    @socket.puts msg
    puts '<< ' << msg
  end

  # Sends a message to users in the channel.
  # @param [String] msg The message to say.
  def say(msg)
    send "PRIVMSG ##{@channel} :#{msg}"
  end

  # Continuously listens to the socket
  # for messages coming from either IRC
  # or users in the channel.
  def listen
    @inbound = @socket.gets
    puts '>> ' << @inbound

    # Stay connected to the server.
    if @inbound.match(/^PING (?<msg>.*)$/)
      pong = Regexp.last_match[:msg]
      send "PONG #{pong}"
    end

    # Respond to messages in the channel.
    @listeners.each do |listener|
      listener.response call if @inbound.match listener.pattern
    end
  end

  # Terminates the IRC connection.
  def quit
    say "#{PARTING_MESSAGES.sample}"
    send "PART ##{@channel} :mic drop"
    send 'QUIT'
  end
end
