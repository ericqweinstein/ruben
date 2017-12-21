# encoding: UTF-8

# @author Eric Weinstein <eric.q.weinstein@gmail.com>

# Collects and initalizes
# listeners from all our scripts.
# @attr [RegExp] pattern A pattern against
# which to match incoming messages.
# @attr [String] response The response to
# provide if the RegExp matches.
class Listener
  attr_accessor :pattern, :response

  @listeners = []

  def initialize(pattern, response)
    self.class.add_listener(self)
    @pattern  = pattern
    @response = response
  end

  class << self
    attr_reader :listeners

    # Adds a listener object to the class'
    # list of listeners.
    # @param [Listener] listener A listener to add.
    def add_listener(listener)
      @listeners << listener
    end
  end
end
