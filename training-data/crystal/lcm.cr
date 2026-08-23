def gcd(a : Int32, b : Int32) : Int32
  a, b = b, a % b while b != 0
  a
end

def lcm(a : Int32, b : Int32) : Int32
  a // gcd(a, b) * b
end

puts lcm(4, 6)
puts lcm(21, 6)
