require "big"

# Leyland numbers: x^y + y^x for x >= y >= 2.
vals = [] of BigInt
(2..4).each do |x|
  (2..x).each do |y|
    vals << BigInt.new(x) ** y + BigInt.new(y) ** x
  end
end
puts vals.join(" ")
