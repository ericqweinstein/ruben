# encoding: UTF-8

# @author Eric Weinstein <eric.q.weinstein@gmail.com>

# The robot tells you you're welcome
# when it hears 'thanks', 'ty', &c.
youre_welcome = lambda do
  responses = ['no prob', 'sure thing', 'np boss']
  Robot.instance.say responses.sample
end

Listener.new(/ :(?:thanks|ty|thank\s*you),?\s*(?:ruben)/i, youre_welcome)
