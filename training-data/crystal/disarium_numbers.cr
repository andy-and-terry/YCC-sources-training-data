# Disarium numbers: digits raised to their 1-based positions sum to n.
def disarium?(n : Int32) : Bool
  n.digits.reverse.each_with_index.sum { |d, i| d ** (i + 1) } == n
end

puts (1...1000).select { |n| disarium?(n) }.join(" ")
