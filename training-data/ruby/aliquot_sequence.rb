# Aliquot sequence: replace n by the sum of its proper divisors.
def aliquot_sum(n)
  (1..n / 2).select { |d| (n % d).zero? }.sum
end

seq = [12]
seq << aliquot_sum(seq.last) while seq.last > 1 && seq.size < 20
puts seq.join(" ")
