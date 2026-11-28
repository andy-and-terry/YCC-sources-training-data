gould = ->(n) { 2**n.to_s(2).count("1") }
puts (0...16).map(&gould).join(" ")
