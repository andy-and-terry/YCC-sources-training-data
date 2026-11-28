def reverse_bits(value, width = 8)
  value.to_s(2).rjust(width, "0").reverse.to_i(2)
end

[1, 6, 13, 128].each { |v| puts "#{v} #{reverse_bits(v)}" } # 128 96 176 1
