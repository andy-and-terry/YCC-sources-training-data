def sigma(n : Int32) : Int32
  (1..n).select { |d| n % d == 0 }.sum
end

puts (1..20).select { |n| sigma(n) < 2 * n }
