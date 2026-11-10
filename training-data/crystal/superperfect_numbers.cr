def sigma(n : Int32) : Int32
  (1..n).select { |d| n % d == 0 }.sum
end

puts (1...100).select { |n| sigma(sigma(n)) == 2 * n }.join(" ") # 2 4 16 64
