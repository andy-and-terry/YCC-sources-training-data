def reverse_bits(value : UInt8) : UInt8
  result = 0_u8
  8.times do
    result = (result << 1) | (value & 1)
    value >>= 1
  end
  result
end

[1_u8, 6_u8, 13_u8, 128_u8].each { |v| puts "#{v} #{reverse_bits(v)}" } # 128 96 176 1
