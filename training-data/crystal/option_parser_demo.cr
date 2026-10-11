require "option_parser"

verbose = false
name = "world"
count = 1

parser = OptionParser.new do |p|
  p.banner = "Usage: greet [options]"
  p.on("-v", "--verbose", "Verbose output") { verbose = true }
  p.on("-n NAME", "--name=NAME", "Who to greet") { |v| name = v }
  p.on("-c COUNT", "--count=COUNT", "Repeat") { |v| count = v.to_i }
  p.on("-h", "--help", "Show help") { puts p }
end

parser.parse(["-v", "--name=Crystal", "-c", "2"])

count.times { puts "Hello, #{name}!" }
puts "verbose=#{verbose}"
