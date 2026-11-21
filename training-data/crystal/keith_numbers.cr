# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
def keith?(n : Int32) : Bool
  seq = n.digits.reverse
  k = seq.size
  seq << seq.last(k).sum while seq.last < n
  seq.last == n
end

puts (10...1200).select { |n| keith?(n) }.join(" ")
