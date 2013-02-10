require_relative "listener"

# Load scripts
Dir[File.dirname(__FILE__) + "/scripts/*.rb"].each { |script| require script }

module Channel

  PARTING_MESSAGES = ["Goodbye!", "Peace!", "Later.", "I'm out!"]

  def send(msg)
    @socket.puts msg
    puts "<< " << msg
  end

  def say(msg)
    send "PRIVMSG ##{@channel} :#{msg}"
  end

  def listen
    @inbound = @socket.gets
    puts ">> " << @inbound

    # Stay connected to the server
    if @inbound.match(/^PING (.*)$/)
      pong = $1
      send "PONG #{pong}"
    end

    # Respond to messages in the channel
    @listeners.each do |listener|
      if @inbound.match(listener.pattern)
        say listener.response
      end
    end
  end

  def quit
    say "#{PARTING_MESSAGES.sample}"
    send "PART ##{@channel} :mic drop"
    send "QUIT"
  end
end

