# Teaching Ruben to tell time

Listener.new(/(?:what\s*time)/i, "Right now it's #{Time.now.localtime.strftime("%H:%M:%S %p")}.")

