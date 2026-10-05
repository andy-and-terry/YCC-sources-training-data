word_groups = Hash(Int32, Array(String)).new { |hash, key| hash[key] = [] of String }

%w(apple fig kiwi banana plum cherry).each do |word|
  word_groups[word.size] << word
end

word_groups.keys.sort.each do |len|
  puts "#{len}: #{word_groups[len].join(", ")}"
end

counts = Hash(Char, Int32).new(0)
"mississippi".each_char { |c| counts[c] += 1 }
puts counts
