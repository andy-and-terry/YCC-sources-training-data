def bell(n)
  row = [1]
  n.times do
    nxt = [row.last]
    row.each { |x| nxt << nxt.last + x }
    row = nxt
  end
  row.first
end

puts (0...10).map { |i| bell(i) }.join(" ")
