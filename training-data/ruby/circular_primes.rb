# Circular primes below 100; expect 13.
def prime?(n)
  n > 1 && (2..Integer.sqrt(n)).none? { |d| (n % d).zero? }
end

def circular?(n)
  s = n.to_s
  (0...s.length).all? { |i| prime?((s[i..] + s[0...i]).to_i) }
end

puts (2...100).count { |n| circular?(n) }
