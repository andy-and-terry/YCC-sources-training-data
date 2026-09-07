def extended_gcd(a : Int32, b : Int32) : Tuple(Int32, Int32, Int32)
  return {a, 1, 0} if b == 0
  gcd, x1, y1 = extended_gcd(b, a % b)
  {gcd, y1, x1 - (a // b) * y1}
end

def mod_inverse(a : Int32, m : Int32) : Int32?
  gcd, x, _ = extended_gcd(a, m)
  return nil if gcd != 1
  ((x % m) + m) % m
end

gcd, x, y = extended_gcd(30, 20)
puts "gcd=#{gcd} x=#{x} y=#{y}"
puts 30 * x + 20 * y

puts mod_inverse(3, 11)
puts mod_inverse(6, 9)
