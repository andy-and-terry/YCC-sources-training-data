s = "abcabc"
k = 3; b = 31_i64; m = 1_000_003_i64
pw = 1_i64
(k - 1).times { pw = pw * b % m }
h = s[0, k].each_char.reduce(0_i64) { |a, c| (a * b + c.ord) % m }
puts "0 #{h}"
(1..s.size - k).each do |i|
  h = (h - s[i - 1].ord * pw % m + m) % m
  h = (h * b + s[i + k - 1].ord) % m
  puts "#{i} #{h}"
end
