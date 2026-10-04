counts = Hash(String, Int32).new(0)
%w[apple banana apple cherry banana apple].each { |w| counts[w] += 1 }
puts counts

groups = Hash(Int32, Array(String)).new { |hash, key| hash[key] = [] of String }
%w[one two three four five six].each { |w| groups[w.size] << w }
groups.each do |size, words|
  puts "#{size}: #{words.join(", ")}"
end

puts counts.fetch("durian", -1)
puts counts.has_key?("apple")
