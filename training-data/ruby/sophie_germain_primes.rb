# Sophie Germain primes: p prime and 2p + 1 prime.
def prime?(n)
  n >= 2 && (2..Integer.sqrt(n)).none? { |d| (n % d).zero? }
end

puts (2...100).select { |p| prime?(p) && prime?(2 * p + 1) }.join(" ")
