# Fermat primality test; Carmichael number 561 fools it.
def powmod(b : Int64, e : Int64, m : Int64) : Int64
  result = 1_i64
  b %= m
  while e > 0
    result = result * b % m if e.odd?
    b = b * b % m
    e >>= 1
  end
  result
end

def probably_prime?(n : Int64) : Bool
  n > 2 && powmod(2_i64, n - 1, n) == 1
end

[97_i64, 91_i64, 561_i64].each { |n| puts "#{n} #{probably_prime?(n)}" }
