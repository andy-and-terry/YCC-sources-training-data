def armstrong?(n : Int32) : Bool
  digits = n.to_s.chars.map { |c| c.to_i }
  power = digits.size
  n == digits.sum { |d| d.to_f64 ** power }.to_i
end

puts armstrong?(153)
puts armstrong?(123)
