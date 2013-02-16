# MAXIMUM WARP

warp_factor = lambda do
  $ruben.say "WARP FACTOR #{rand(9) + 1}"
end

Listener.new(/\bengage\b/i, warp_factor)

