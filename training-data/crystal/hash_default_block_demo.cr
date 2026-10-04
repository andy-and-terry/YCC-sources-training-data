counts = Hash(Char, Int32).new(0)
"mississippi".each_char { |c| counts[c] += 1 }
puts counts.inspect

groups = Hash(Int32, Array(String)).new { |hash, key| hash[key] = [] of String }
%w[apple fig banana kiwi plum cherry].each do |word|
  groups[word.size] << word
end
puts groups.inspect

puts counts.fetch('z', -1)
puts counts.fetch('s') { |k| 0 }
puts counts.select { |_, v| v > 1 }.keys.inspect
puts counts.to_a.sort_by { |_, v| -v }.first.inspect
