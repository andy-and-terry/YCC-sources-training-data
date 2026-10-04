# String formatting helpers.
puts "%05.1f|%-6s|%+d" % [3.14159, "ab", 7]
puts "%x %o %b" % [255, 8, 5]
puts 1234567.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
puts 42.to_s.rjust(6, '0')
puts "title".center(11, '*')
puts 3.14159.round(2)
puts 255.to_s(16).upcase
puts "name=%s age=%d" % {"Bob", 41}
puts "Hello, %{who}!" % {who: "World"}
