rows = [["apple", 3, 1.5], ["pear", 12, 0.75]]
rows.each { |n, q, p| puts "#{n.ljust(8)}#{q.to_s.rjust(4)}#{format('%8.2f', p)}" }
puts "%-6s|%+d|%x|%08.3f" % ["ab", 5, 255, 3.14159]
