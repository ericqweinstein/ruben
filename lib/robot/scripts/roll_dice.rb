# Ruben's a gamblin' man

roll_dice = lambda do
  lucky_number = rand(5) + 1

  Robot.instance.say "you rolled a #{lucky_number}!"
end

Listener.new(/ :(?:(?:ruben)?,?\s*roll\s*(?:the)?\s*dice)/i, roll_dice)

