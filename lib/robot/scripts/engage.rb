# encoding: UTF-8
# @author Eric Weinstein <eric.q.weinstein@gmail.com>

# Provides a random warp factor whenever
# the robot hears the word 'engage'.
warp_factor = lambda do
  Robot.instance.say "WARP FACTOR #{rand(9) + 1}"
end

Listener.new(/ :\bengage\b/i, warp_factor)
