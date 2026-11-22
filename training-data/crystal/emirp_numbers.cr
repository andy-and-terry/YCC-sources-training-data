# Emirps: primes whose digit reversal is a different prime.
def prime?(n : Int32) : Bool
  return false if n < 2
  d = 2
  while d * d <= n
    return false if n % d == 0
    d += 1
  end
  true
end

def emirp?(n : Int32) : Bool
  r = n.to_s.reverse.to_i
  r != n && prime?(n) && prime?(r)
end

puts (2...200).select { |n| emirp?(n) }.join(" ")
