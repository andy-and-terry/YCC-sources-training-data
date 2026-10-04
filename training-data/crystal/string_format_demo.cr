name = "Crystal"
version = 1.9
puts "Hello, #{name} #{version}!"
puts "%05d" % 42
puts "%.3f" % 3.14159265
puts "%-8s|" % "left"
puts "%8s|" % "right"
puts "%x %o %b" % [255, 8, 5]
puts 1234567.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
puts name.center(15, '*')
puts name.ljust(10, '.') + "end"
puts name.rjust(10, '.')
