def gould(n : Int32) : Int32
  1 << n.popcount
end

puts (0...16).map { |n| gould(n) }
