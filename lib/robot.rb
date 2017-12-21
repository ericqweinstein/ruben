# encoding: UTF-8

# @author Eric Weinstein <eric.q.weinstein@gmail.com>

require 'socket'
require 'singleton'
require_relative 'robot/channel'
require_relative 'robot/listener'

# Handles connection to the TCP socket and
# sending credentials as per the IRC protocol.
# @see http://tools.ietf.org/html/rfc2812
# @attr_reader [TCPSocket] socket A TCP socket.
# @attr [String] server An IRC server.
# @attr [Integer] port The port to connect to.
# @attr [String] channel The IRC channel to join.
# @attr [String] nick The robot's nickname.
# @attr [Array<Listener>] listeners A list
# of all registered listeners.
class Robot
  include Singleton
  include Channel

  attr_reader :socket
  attr_accessor :server, :port, :channel, :nick, :listeners

  def initialize
    @listeners = Listener.listeners
  end

  # The main event loop.
  def run
    begin
      @socket = TCPSocket.open(server, port)
    rescue => e
      puts "An error occurred: #{e.message}"
      exit 1
    end

    send 'USER ruben 0 * :Ruben'
    send "NICK #{@nick}"
    send "JOIN ##{@channel}"

    listen until @socket.eof?
  end
end
