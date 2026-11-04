def gcd_all(nums : Array(Int32)) : Int32
  nums.reduce(0) { |acc, n| acc.gcd(n) }
end

puts gcd_all([12, 18, 24])
puts gcd_all([7, 13])
puts 4.lcm(6)
