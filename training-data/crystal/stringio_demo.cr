io = IO::Memory.new
io << "Line one\n"
io.puts "Line two"
io.printf("%05.1f|%-5s|\n", 3.14159, "ab")
io.print 1, " ", 2, "\n"

output = io.to_s
puts output.lines.size
puts output

reader = IO::Memory.new("alpha beta\ngamma delta\n")
reader.each_line do |line|
  puts line.split.reverse.join(" ")
end

str = String.build do |s|
  3.times { |i| s << i << "," }
end
puts str.chomp(',')
