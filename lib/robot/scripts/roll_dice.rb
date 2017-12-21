# encoding: UTF-8

# @author Eric Weinstein <eric.q.weinstein@gmail.com>

# The robot rolls a D6 whenever
# it hears 'roll the dice'.
roll_dice = lambda do
  lucky_number = rand(5) + 1

  Robot.instance.say "you rolled a #{lucky_number}!"
end

Listener.new(/ :(?:(?:ruben)?,?\s*roll\s*(?:the)?\s*dice)/i, roll_dice)
