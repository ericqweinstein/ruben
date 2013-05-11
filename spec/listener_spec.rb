require_relative "../lib/robot/listener"

describe Listener do
  before(:all) do
    @test_listener = Listener.new(/^test$/, "Test works!")
  end

  describe "#new" do
    it "should make a new Listener object" do
      @test_listener.should be_an_instance_of Listener
      @test_listener.pattern.should eql Regexp.new('^test$')
      @test_listener.response.should eql "Test works!"
    end

    it "should add itself to the listeners collector" do
      all_the_listeners = Listener.all_listeners
      this_listener = (all_the_listeners.size - 1)
      all_the_listeners[this_listener].pattern.should eql Regexp.new('^test$')
      all_the_listeners[this_listener].response.should eql "Test works!"
    end
  end
end

