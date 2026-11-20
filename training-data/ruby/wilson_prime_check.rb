# Wilson's theorem primality test.
def wilson_prime?(n)
  return false if n < 2
  (2...n).reduce(1) { |f, i| f * i % n } == n - 1
end
p (2..19).select { |n| wilson_prime?(n) }
