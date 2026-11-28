def bwt(s)
  (0...s.size).map { |i| s[i..] + s[0...i] }.sort.map { |r| r[-1] }.join
end

puts bwt("banana$")
