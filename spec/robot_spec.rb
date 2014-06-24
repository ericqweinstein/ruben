# encoding: UTF-8
# @author Eric Weinstein <eric.q.weinstein@gmail.com>
require_relative '../lib/robot'

describe Robot do
  describe '#new' do
    it 'is private' do
      expect { Robot.new }.to raise_error(NoMethodError)
    end
  end

  describe '#instance' do
    it 'creates a Robot if there isn\'t one already' do
      robot = Robot.instance
      robot.should be_an_instance_of Robot
    end

    it 'only instantiates one robot' do
      robot_a = Robot.instance
      robot_b = Robot.instance
      robot_a.should eq(robot_b)
    end
  end
end
