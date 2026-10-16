require "tmpdir"
require "fileutils"

path = "/usr/local/lib/ruby/app.config.rb"
puts File.basename(path), File.basename(path, ".rb"), File.basename(path, ".*")
puts File.dirname(path), File.extname(path)
puts File.join("a", "b", "c.txt"), File.split(path).inspect
puts File.expand_path("x", "/base"), File.absolute_path?("/x")

Dir.mktmpdir do |d|
  f = File.join(d, "sub", "note.txt")
  FileUtils.mkdir_p(File.dirname(f))
  File.write(f, "hello\nworld\n")
  puts File.exist?(f), File.size(f), File.file?(f), File.directory?(d)
  puts File.readlines(f, chomp: true).inspect
  File.open(f, "a") { |h| h.puts "more" }
  puts File.foreach(f).count
  puts Dir.glob("**/*", base: d).sort.inspect
  FileUtils.rm_rf(File.dirname(f))
  puts Dir.empty?(d)
end
