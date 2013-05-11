# Heads I win, tails you lose

flip_coin = lambda do
  coin_flip = rand(2)
  result = coin_flip == 1 ? "heads" : "tails"

  Robot.instance.say "#{result}!"
end

Listener.new(/ :(?:(?:ruben)?,?\s*flip\s*(?:a)?\s*coin)/i, flip_coin)

