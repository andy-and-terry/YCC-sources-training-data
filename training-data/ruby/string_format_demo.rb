puts format("%05d", 42)
puts format("%+d %+d", 5, -5)
puts format("%.3f", 3.14159)
puts format("%10s|%-10s|", "right", "left")
puts format("%x %X %o %b", 255, 255, 8, 5)
puts format("%08.3f", 3.14159)
puts format("%e", 12345.678)
puts format("%c%c%c", 82, 98, 121)
puts format("%%")

puts format("%<name>s is %<age>d years old", name: "Zoe", age: 30)
puts format("%{a}-%{b}", a: "x", b: "y")

puts "%s has %d items" % ["cart", 3]
puts "%.1f%%" % 99.5

puts 1234567.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
puts 12.to_s.rjust(5, "0"), "ab".center(8, "*"), "ab".ljust(5, ".") + "|"
puts 255.to_s(2), "ff".hex, "0b101".to_i(0), "12abc".to_i
puts 10.fdiv(4), 10.divmod(4).inspect, (-7).divmod(2).inspect
