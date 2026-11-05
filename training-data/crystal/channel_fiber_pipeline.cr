ch = Channel(Int32).new
done = Channel(Nil).new

spawn do
  3.times { |i| ch.send(i * i) }
  ch.close
end

spawn do
  while v = ch.receive?
    puts v
  end
  done.send(nil)
end

done.receive
