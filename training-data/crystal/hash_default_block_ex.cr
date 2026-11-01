h = Hash(String, Array(Int32)).new { |hash, k| hash[k] = [] of Int32 }
h["a"] << 1
h["a"] << 2
h["b"] << 3
puts h
counts = Hash(Char, Int32).new(0)
"hello".each_char { |c| counts[c] += 1 }
puts counts
