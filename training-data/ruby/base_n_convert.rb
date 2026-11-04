[2, 8, 16, 36].each { |b| puts "255 in base #{b} = #{255.to_s(b)}" }
puts "zz".to_i(36)
puts Integer("9", 8) rescue puts "rejected: invalid digit for base 8"
