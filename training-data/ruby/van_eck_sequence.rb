def van_eck(count)
  seq = [0]
  last_seen = {}
  (0...count - 1).each do |i|
    cur = seq[i]
    nxt = last_seen.key?(cur) ? i - last_seen[cur] : 0
    last_seen[cur] = i
    seq << nxt
  end
  seq
end

puts van_eck(20).join(" ")
