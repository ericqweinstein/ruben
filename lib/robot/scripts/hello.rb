# Friendly robots are good robots

say_hello = lambda do
  greetings = ["sup", "hey", "what up", "sup g"]
  $ruben.say "#{greetings.sample}"
end

Listener.new(/:(?:hi|hello|hey)\s*,?\s*(?:ruben)/i, say_hello)

