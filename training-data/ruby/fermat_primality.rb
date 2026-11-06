# Fermat primality test; Carmichael number 561 fools it.
def probably_prime?(n)
  n > 2 && 2.pow(n - 1, n) == 1
end

[97, 91, 561].each { |n| puts "#{n} #{probably_prime?(n)}" }
