# Formatting numbers and padding strings.
puts "%05d" % 42
puts "%.3f" % 3.14159
puts "%x %o %b" % [255, 8, 5]
puts "%-8s|%8s|" % ["left", "right"]
puts "name".ljust(10, '.') + "end"
puts "7".rjust(3, '0')
puts "mid".center(9, '*')
puts 1234567.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
puts 255.to_s(2)
puts "ff".to_i(16)
