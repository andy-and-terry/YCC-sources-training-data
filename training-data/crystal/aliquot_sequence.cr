# Aliquot sequence: replace n by the sum of its proper divisors.
def aliquot_sum(n : Int32) : Int32
  (1..n // 2).select { |d| n % d == 0 }.sum
end

seq = [12]
while seq.last > 1 && seq.size < 20
  seq << aliquot_sum(seq.last)
end
puts seq.join(" ")
