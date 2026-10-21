# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
def hamming?(n)
  [2, 3, 5].each { |p| n /= p while (n % p).zero? }
  n == 1
end

puts (1..Float::INFINITY).lazy.select { |n| hamming?(n) }.first(20).join(" ")
