puts format("%05d|%-6s|%6.2f|%x|%o|%b", 42, "ab", 3.14159, 255, 8, 5)
puts "%s is %d years old" % ["Tom", 30]
puts "%<name>s has %<n>03d items" % { name: "cart", n: 7 }
puts "%-10s|" % "left"
puts "%+d %+d" % [5, -5]
puts "%e" % 12345.678
puts "%c%c" % [72, "i"]
puts 1234567.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
puts "abc".center(9, "*"), "abc".ljust(6, ".") + "|", "abc".rjust(6) + "|"
