# File I/O with Tempfile: write, read lines, append, seek.
require "tempfile"

Tempfile.create("demo") do |f|
  f.puts "alpha"
  f.puts "beta"
  f.write "gamma\n"
  f.flush

  puts File.size(f.path)
  puts File.readlines(f.path, chomp: true).inspect

  File.open(f.path, "a") { |io| io << "delta\n" }
  File.foreach(f.path).with_index(1) { |line, i| puts "#{i}: #{line}" }

  f.rewind
  puts f.gets
  f.seek(-6, IO::SEEK_END)
  puts f.read
end

puts File.basename("/a/b/file.tar.gz", ".gz")
puts File.extname("report.pdf")
puts File.join("a", "b", "c.txt")
puts File.exist?("/definitely/not/here")
