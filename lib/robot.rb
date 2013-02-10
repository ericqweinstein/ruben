require "socket"
require_relative "robot/channel"
require_relative "robot/listener"

class Robot
  include Channel

  attr_reader :channel, :socket, :nick
  attr_accessor :listeners

  def initialize(server, port, channel, nick)
    @socket    = TCPSocket.open(server, port)
    @channel   = channel
    @nick      = nick
    @listeners = Listener.all_listeners
  end

  def run
    send "USER ruben 0 * :Ruben"
    send "NICK #{@nick}"
    send "JOIN ##{@channel}"

    until @socket.eof? do
      listen
    end
  end
end

