# format / sprintf directives and String justification helpers.
puts format("%05d|%-6s|%6s|", 42, "ab", "cd")
puts format("%.3f %e %x %o %b", 3.14159, 12345.678, 255, 8, 5)
puts format("%+d %+d", 5, -5)
puts format("%<name>s is %<age>d", name: "Ann", age: 30)
puts format("%{a}-%{b}", a: 1, b: 2)
puts "%s has %d items" % ["cart", 3]
puts "%.1f%%" % 99.5

rows = [["apple", 1.5], ["kiwi", 12.25], ["fig", 0.75]]
rows.each { |name, price| puts "#{name.ljust(8, '.')}#{format('%7.2f', price)}" }
puts "title".center(15, "*")
puts 1234567.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
