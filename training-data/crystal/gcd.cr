def gcd(a : Int32, b : Int32) : Int32
  x, y = a, b
  while y != 0
    x, y = y, x % y
  end
  x
end

puts gcd(48, 18)
puts gcd(100, 75)
