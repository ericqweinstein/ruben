# encoding: UTF-8

# @author Eric Weinstein <eric.q.weinstein@gmail.com>

# The robot tells you what time it
# is when it hears 'what time'.
what_time = lambda do
  current_hour = Time.now.localtime.strftime('%H').to_i
  current_hour = current_hour > 12 ? current_hour - 12 : current_hour

  Robot.instance.say "I dunno, around #{Time
    .now.localtime.strftime("#{current_hour}:%M %p")}"
end

Listener.new(/ :(?:what\s*time)/i, what_time)
