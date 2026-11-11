# Emirps: primes whose digit reversal is a different prime.
def prime?(n)
  n >= 2 && (2..Integer.sqrt(n)).none? { |i| (n % i).zero? }
end

emirps = (2...100).select do |n|
  r = n.to_s.reverse.to_i
  r != n && prime?(n) && prime?(r)
end
puts emirps.join(" ")
