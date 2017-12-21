# encoding: UTF-8

# @author Eric Weinstein <eric.q.weinstein@gmail.com>

# The robot says hello when greeted
# with any of the greetings.
say_hello = lambda do
  greetings = ['sup', 'hey', 'what up', 'sup g']
  Robot.instance.say greetings.sample
end

Listener.new(/ :(?:hi|hello|hey)\s*,?\s*(?:ruben)/i, say_hello)
