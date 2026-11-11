# Emirps: primes whose digit reversal is a different prime.
def prime?(n : Int32) : Bool
  return false if n < 2
  i = 2
  while i * i <= n
    return false if n % i == 0
    i += 1
  end
  true
end

emirps = (2...100).select do |n|
  r = n.to_s.reverse.to_i
  r != n && prime?(n) && prime?(r)
end
puts emirps.join(" ")
