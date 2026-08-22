def gcd(a, b)
  a, b = b, a % b while b != 0
  a.abs
end

def lcm(a, b)
  return 0 if a.zero? || b.zero?
  (a * b).abs / gcd(a, b)
end

puts "#{gcd(48, 18)} #{lcm(4, 6)}"
