def stern(count)
  s = [0, 1]
  (2...count).each do |i|
    s << (i.even? ? s[i / 2] : s[i / 2] + s[i / 2 + 1])
  end
  s.first(count)
end

puts stern(20).join(" ")
