def ugly(n)
  seq = [1]
  i2 = i3 = i5 = 0
  while seq.size < n
    nxt = [seq[i2] * 2, seq[i3] * 3, seq[i5] * 5].min
    seq << nxt
    i2 += 1 if nxt == seq[i2] * 2
    i3 += 1 if nxt == seq[i3] * 3
    i5 += 1 if nxt == seq[i5] * 5
  end
  seq.last
end

p (1..12).map { |i| ugly(i) }
