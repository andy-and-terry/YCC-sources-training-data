def extended_gcd(a, b)
  return [a, 1, 0] if b.zero?

  g, x1, y1 = extended_gcd(b, a % b)
  [g, y1, x1 - (a / b) * y1]
end

def mod_inverse(a, m)
  g, x, = extended_gcd(a, m)
  raise ArgumentError, "#{a} has no inverse modulo #{m}" unless g == 1

  x % m
end

puts extended_gcd(35, 15).inspect
inv = mod_inverse(3, 11)
puts inv
puts((3 * inv) % 11 == 1)
