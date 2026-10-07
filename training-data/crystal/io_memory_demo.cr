io = IO::Memory.new
io << "line one\n"
io.puts "line two"
io.printf "%05.1f\n", 3.14159
io.print 1, 2, 3, "\n"

text = io.to_s
puts text
puts "bytes: #{io.bytesize}"

reader = IO::Memory.new("alpha\nbeta\ngamma\n")
reader.each_line.with_index do |line, i|
  puts "#{i + 1}. #{line}"
end

built = String.build do |s|
  3.times { |i| s << "item" << i << ";" }
end
puts built
