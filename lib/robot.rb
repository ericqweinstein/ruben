require "socket"
require "singleton"
require_relative "robot/channel"
require_relative "robot/listener"

class Robot
  include Singleton
  include Channel

  attr_reader :socket
  attr_accessor :server, :port, :channel, :nick, :listeners

  def initialize
    @listeners = Listener.all_listeners
  end

  def run
    begin
      @socket = TCPSocket.open(server, port)
    rescue
      puts "An error occurred. Make sure to call Ruben with a valid server and port name."
      exit
    end

    send "USER ruben 0 * :Ruben"
    send "NICK #{@nick}"
    send "JOIN ##{@channel}"

    until @socket.eof? do
      listen
    end
  end
end

