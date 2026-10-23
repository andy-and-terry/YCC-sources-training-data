text = "cat bat rat"
map = {"cat" => "dog", "bat" => "owl"}

puts text.gsub(map)
puts text.gsub(/[a-z]at/) { |word| word.upcase }
puts text.gsub(/(?<first>\w)at/, "\\k<first>ot")
puts text.sub("rat", "mouse")
puts text.tr("abc", "xyz")
puts text.delete("a")
puts text.squeeze("t")
