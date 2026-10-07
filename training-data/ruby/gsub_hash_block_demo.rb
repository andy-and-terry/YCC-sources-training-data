# gsub with a replacement hash, a block, and named captures.
puts "cat and dog".gsub(/cat|dog/, "cat" => "dog", "dog" => "cat")
puts "price: 5 and 12".gsub(/\d+/) { |n| (n.to_i * 2).to_s }
puts "john smith".gsub(/\b\w/) { $&.upcase }
puts "2024-03-01".sub(/(?<y>\d+)-(?<m>\d+)-(?<d>\d+)/, '\k<d>/\k<m>/\k<y>')

if (m = "key=value".match(/(?<key>\w+)=(?<val>\w+)/))
  puts m[:key], m[:val]
  p m.named_captures
end

p "a1b22c333".scan(/[a-z]\d+/)
p "hello world".tr("lo", "01")
p "snake_case_name".split("_").map.with_index { |w, i| i.zero? ? w : w.capitalize }.join
p "x".match?(/y/)
