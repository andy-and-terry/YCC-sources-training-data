# Sexy primes below 100; expect 16 pairs.
def prime?(n : Int32) : Bool
  return false if n < 2
  d = 2
  while d * d <= n
    return false if n % d == 0
    d += 1
  end
  true
end

puts (2...100).count { |p| prime?(p) && prime?(p + 6) }
