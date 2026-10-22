def proper_divisor_sum(n)
  (1...n).select { |d| (n % d).zero? }.sum
end

def aliquot(start)
  seq = [start]
  seq << proper_divisor_sum(seq.last) until seq.last.zero?
  seq
end

puts aliquot(12).join(" ")
