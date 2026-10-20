require "tempfile"
Tempfile.create("demo") do |f|
  f.puts "alpha", "beta", "gamma"
  f.flush
  File.foreach(f.path).with_index(1) { |l, i| puts "#{i}: #{l.chomp}" }
  puts File.read(f.path).lines.count, File.size(f.path), File.basename(f.path).start_with?("demo")
end
puts File.join("a", "b", "c.rb"), File.extname("x/y.tar.gz"), File.dirname("/a/b/c")
