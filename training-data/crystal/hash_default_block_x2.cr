h = Hash(String, Array(Int32)).new { |hash, k| hash[k] = [] of Int32 }
h["a"] << 1
h["a"] << 2
puts h
