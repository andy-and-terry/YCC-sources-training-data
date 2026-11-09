ch = Channel(Int32).new
spawn do
  3.times { |i| ch.send(i * i) }
  ch.close
end
while v = ch.receive?
  puts v
end
