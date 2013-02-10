require_relative "../lib/robot"

describe Robot do
  describe "#new" do
    it "should create robot instances" do
      @robot = Robot.new("irc.freenode.net", 6667, "test_chan", "ruben_")
      @robot.channel.should eql "test_chan"
      @robot.socket.should be_an_instance_of TCPSocket
      @robot.socket.close
    end
  end
end

