require "stringio"

input = StringIO.new("alpha\nbeta\n42\n")
$stdin = input
name = gets.chomp
puts "first: #{name}"
puts "rest: #{$stdin.read.inspect}"

io = StringIO.new("line1\nline2\nline3")
io.each_line.with_index(1) { |l, i| puts "#{i}: #{l.chomp}" }
io.rewind
puts io.readline.inspect, io.getc, io.read(3).inspect, io.eof?

out = StringIO.new
out << "a" << 1
out.puts "b"
out.printf("%03d\n", 7)
puts out.string.inspect

$stdin = STDIN
captured = StringIO.new
old = $stdout
$stdout = captured
puts "hidden"
$stdout = old
puts captured.string.inspect
