# Circular primes below 100; expect 13.
def prime?(n : Int32) : Bool
  return false if n < 2
  d = 2
  while d * d <= n
    return false if n % d == 0
    d += 1
  end
  true
end

def circular?(n : Int32) : Bool
  s = n.to_s
  (0...s.size).all? { |i| prime?((s[i..] + s[0...i]).to_i) }
end

puts (2...100).count { |n| circular?(n) }
