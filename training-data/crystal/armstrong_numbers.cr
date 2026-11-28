def armstrong?(n : Int32) : Bool
  ds = n.digits
  ds.sum { |d| d ** ds.size } == n
end

puts (1...1000).select { |n| armstrong?(n) }.join(" ") # 1..9 153 370 371 407
