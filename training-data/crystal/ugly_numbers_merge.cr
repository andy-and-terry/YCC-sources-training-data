def ugly(n : Int32) : Int64
  seq = [1_i64]
  i2 = i3 = i5 = 0
  while seq.size < n
    c2, c3, c5 = seq[i2] * 2, seq[i3] * 3, seq[i5] * 5
    nxt = {c2, c3, c5}.min
    seq << nxt
    i2 += 1 if nxt == c2
    i3 += 1 if nxt == c3
    i5 += 1 if nxt == c5
  end
  seq[n - 1]
end

puts (1..12).map { |i| ugly(i) }.join(" ")
