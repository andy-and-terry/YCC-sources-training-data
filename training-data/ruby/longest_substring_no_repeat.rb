def longest_unique(s)
  last = {}
  start = 0
  best = 0...0
  s.each_char.with_index do |c, i|
    start = last[c] + 1 if last.key?(c) && last[c] >= start
    last[c] = i
    best = start..i if i - start + 1 > best.size
  end
  s[best]
end

%w[abcabcbb bbbbb pwwkew dvdf].each do |s|
  r = longest_unique(s)
  puts "#{s} #{r} #{r.size}"
end
