puts "hi".center(10, "*")
puts "hi".ljust(6, ".") + "|"
puts "hi".rjust(6) + "|"

rows = [["Name", "Qty"], ["apple", 3], ["watermelon", 12]]
width = rows.map { |r| r[0].to_s.size }.max
rows.each { |n, q| puts "#{n.to_s.ljust(width)} | #{q.to_s.rjust(3)}" }

puts "=" * 20
puts "Title".center(20, "-")
puts "%-10s|%5.1f|" % ["pi", 3.14159]
puts "abc".succ, "az".next, "zz".succ
puts "ruby" * 3
puts "a-b-c".tr("-", "_"), "hello".delete("l"), "aaabbb".squeeze
