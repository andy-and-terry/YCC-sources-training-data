# Emirps: primes whose digit reversal is a different prime.
def prime?(n)
  n >= 2 && (2..Integer.sqrt(n)).none? { |d| (n % d).zero? }
end

def emirp?(n)
  r = n.to_s.reverse.to_i
  r != n && prime?(n) && prime?(r)
end

puts (2...200).select { |n| emirp?(n) }.join(" ")
