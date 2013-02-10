class Listener
  attr_accessor :pattern, :response

  @@listeners = []
  
  def initialize(pattern, response)
    @@listeners << self
    @pattern = pattern
    @response = response
  end

  def self.all_listeners
    @@listeners
  end
end

