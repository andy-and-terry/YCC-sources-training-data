counts = Hash(Char, Int32).new(0)
"mississippi".each_char { |c| counts[c] += 1 }
puts counts
puts "hello world".split.map(&.capitalize).join(" ")
