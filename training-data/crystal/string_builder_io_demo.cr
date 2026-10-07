# String.build writes into an IO::Memory without intermediate strings.
result = String.build do |io|
  io << "Items: "
  [1, 2, 3].each_with_index do |n, i|
    io << ", " if i > 0
    io << n
  end
  io << '.'
end
puts result

io = IO::Memory.new
io.puts "line one"
io.print "line ", "two"
puts io.to_s.inspect
