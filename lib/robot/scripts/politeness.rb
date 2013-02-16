# Polite robots are good robots

youre_welcome = lambda do
  responses = ["no prob", "sure thing", "np boss"]
  $ruben.say "#{responses.sample}"
end
  
Listener.new(/:(?:thanks|ty|thank\s*you),?\s*(?:ruben)/i, youre_welcome)

