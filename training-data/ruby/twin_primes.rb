# Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
def prime?(n)
  n >= 2 && (2..Integer.sqrt(n)).none? { |d| (n % d).zero? }
end

puts (2...100).select { |p| prime?(p) && prime?(p + 2) }.join(" ")
