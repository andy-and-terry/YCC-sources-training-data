def bwt(s : String) : String
  rots = (0...s.size).map { |i| s[i..] + s[0...i] }.sort
  rots.map(&.[-1]).join
end

puts bwt("banana$")
