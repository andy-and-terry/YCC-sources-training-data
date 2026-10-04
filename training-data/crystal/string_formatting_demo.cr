name = "Crystal"
version = 1.12
count = 42

puts "#{name} v#{version}"
puts "%s has %d items (%.1f%%)" % [name, count, 87.456]
puts format("%08.3f", 3.14159)
puts format("%-10s|%10s|", "left", "right")
puts format("%x %o %b", 255, 8, 5)
puts count.to_s(2).rjust(8, '0')
puts count.to_s(16).upcase
puts 1234567.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
puts 12.5.round.to_i
puts 3.14159.round(2)
puts "tab\tseparated".inspect
puts :sym.to_s + "!"
