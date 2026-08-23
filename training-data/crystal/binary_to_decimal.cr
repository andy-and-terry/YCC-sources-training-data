def binary_to_decimal(bin : String) : Int32
  bin.to_i(base: 2)
end

puts binary_to_decimal("1010")
puts binary_to_decimal("11111111")
