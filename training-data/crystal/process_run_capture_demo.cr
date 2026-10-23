# Process.run spawns a child process and captures its output.
output = IO::Memory.new
error = IO::Memory.new

status = Process.run("echo", args: ["hello", "from", "child"], output: output, error: error)
puts status.success?
puts status.exit_code
puts output.to_s.strip

# Feed stdin to a child process
input = IO::Memory.new("banana\napple\ncherry\n")
sorted = IO::Memory.new
Process.run("sort", input: input, output: sorted)
puts sorted.to_s.lines.inspect

# A shell command with a non-zero exit status
failed = Process.run("sh", args: ["-c", "exit 3"])
puts failed.success?
puts failed.exit_code

# Process.run with shell: true runs through /bin/sh
out = IO::Memory.new
Process.run("echo $((6 * 7))", shell: true, output: out)
puts out.to_s.strip
