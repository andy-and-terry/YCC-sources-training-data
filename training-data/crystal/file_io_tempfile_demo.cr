path = File.tempname("demo", ".txt")

File.write(path, "alpha\nbeta\ngamma\n")
puts File.exists?(path)
puts File.size(path)
puts File.read(path).lines.inspect

File.open(path, "a") { |f| f.puts "delta" }
File.each_line(path) { |line| puts line.upcase }

lines = File.read_lines(path)
puts lines.size
puts File.basename(path).ends_with?(".txt")
puts File.extname(path)

File.delete(path)
puts File.exists?(path)
