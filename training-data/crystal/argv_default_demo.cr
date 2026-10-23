name = ARGV[0]? || "world"
count = (ARGV[1]? || "2").to_i

count.times { puts "Hello, #{name}!" }
puts "args given: #{ARGV.size}"
puts PROGRAM_NAME.empty? ? "unknown" : "program name set"
