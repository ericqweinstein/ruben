# encoding: UTF-8

# @author Eric Weinstein <eric.q.weinstein@gmail.com>

# The robot flips a coin when
# it hears 'flip a coin'.
flip_coin = lambda do
  coin_flip = rand(2)
  result = coin_flip == 1 ? 'heads' : 'tails'

  Robot.instance.say "#{result}!"
end

Listener.new(/ :(?:(?:ruben)?,?\s*flip\s*(?:a)?\s*coin)/i, flip_coin)
