def armstrong?(n)
  digits = n.digits
  digits.sum { |d| d**digits.size } == n
end

p (1...1000).select { |n| armstrong?(n) } # [1..9, 153, 370, 371, 407]
