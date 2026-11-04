[2, 8, 16, 36].each do |b|
  puts "255 in base #{b} = #{255.to_s(b)}"
end
puts "zz".to_i(36)
puts "9".to_i?(8).inspect # nil
