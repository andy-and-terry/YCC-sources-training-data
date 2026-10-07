text = "John Smith, Jane Doe"
puts text.gsub(/(?<first>\w+) (?<last>\w+)/, '\k<last>, \k<first>')

puts "hello world".gsub(/o/) { |m| m.upcase }
puts "a1b22c333".gsub(/\d+/) { |d| (d.to_i * 2).to_s }
puts "cat hat".gsub(/[ch]at/, "cat" => "dog", "hat" => "cap")

if (m = /(?<h>\d+):(?<min>\d+)/.match("at 12:45 sharp"))
  puts m[:h], m[:min], m.pre_match.inspect
end

if /(?<year>\d{4})-(?<mon>\d\d)/ =~ "on 2024-06-01"
  puts year, mon
end

p "snake_case_word".split("_").map.with_index { |w, i| i.zero? ? w : w.capitalize }.join
