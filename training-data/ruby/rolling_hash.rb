s, k, b, m = "abcabc", 3, 31, 1_000_003
pw = (b**(k - 1)) % m
h = s[0, k].each_char.reduce(0) { |a, c| (a * b + c.ord) % m }
puts "0 #{h}"
(1..s.size - k).each do |i|
  h = (h - s[i - 1].ord * pw % m) % m
  h = (h * b + s[i + k - 1].ord) % m
  puts "#{i} #{h}"
end
