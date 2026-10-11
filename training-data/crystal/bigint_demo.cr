require "big"

def factorial(n : Int32) : BigInt
  (1..n).reduce(BigInt.new(1)) { |acc, i| acc * i }
end

puts factorial(30)
puts factorial(25).to_s.size

a = BigInt.new("123456789012345678901234567890")
b = BigInt.new(987654321)
puts a * b
puts a // b
puts a % b
puts BigInt.new(2) ** 100
puts a.to_s.chars.map(&.to_i).sum
puts (BigInt.new(2) ** 64 - 1).to_s(16)
