require "open3"

out, status = Open3.capture2("echo", "hello from child")
puts out
puts status.success?

out, err, status = Open3.capture3("ls", "/definitely/missing")
puts out.empty?
puts err.empty?
puts status.exitstatus != 0
