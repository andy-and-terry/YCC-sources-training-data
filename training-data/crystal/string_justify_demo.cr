items = {"Tea" => 2.5, "Coffee" => 3.75, "Biscuit" => 1.0}

items.each do |name, price|
  puts "#{name.ljust(10, '.')}#{price.to_s.rjust(6)}"
end

puts "title".center(15, '*')
puts "%-8s|%5d|%8.2f" % ["row", 42, 3.14159]
puts 255.to_s(2).rjust(10, '0')
puts 255.to_s(16).upcase
puts "abc".succ
puts "line1\nline2".lines.inspect
puts "snake_case_word".split('_').map(&.capitalize).join
