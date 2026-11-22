# Sophie Germain primes: p prime and 2p + 1 prime.
def prime?(n : Int32) : Bool
  return false if n < 2
  d = 2
  while d * d <= n
    return false if n % d == 0
    d += 1
  end
  true
end

puts (2...100).select { |p| prime?(p) && prime?(2 * p + 1) }.join(" ")
