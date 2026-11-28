def pronic?(x : Int32) : Bool
  n = Math.isqrt(x)
  n * (n + 1) == x
end

puts (0...10).map { |n| n * (n + 1) }.join(" ") # 0 2 6 12 20 30 42 56 72 90
puts "#{pronic?(56)} #{pronic?(57)}"             # true false
