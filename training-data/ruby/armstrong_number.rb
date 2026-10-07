def armstrong?(n)
  digits = n.digits
  digits.sum { |d| d**digits.size } == n
end

p (1...1_000_000).select { |n| armstrong?(n) }
