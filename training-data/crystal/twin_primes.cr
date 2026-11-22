# Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
def prime?(n : Int32) : Bool
  return false if n < 2
  d = 2
  while d * d <= n
    return false if n % d == 0
    d += 1
  end
  true
end

puts (2...100).select { |p| prime?(p) && prime?(p + 2) }.join(" ")
