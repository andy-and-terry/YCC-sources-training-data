name = "Ada"
score = 93.456

puts format("%-8s|%8.2f|", name, score)
puts "%05d %x %o %b %e" % [42, 255, 8, 5, 12345.678]
puts "%s has %d items" % ["cart", 3]
puts format("%<name>s scored %<score>.1f", name: name, score: score)
puts format("%{a}-%{b}", a: 1, b: 2)

puts name.center(11, "*")
puts name.ljust(6, ".") + "|"
puts name.rjust(6) + "|"
puts 1234567.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
puts 3.14159.round(2), 10.fdiv(4), 7.divmod(2).inspect
