require "optparse"

options = { verbose: false, count: 1 }

parser = OptionParser.new do |opts|
  opts.banner = "Usage: demo [options]"
  opts.on("-v", "--verbose", "Verbose output") { options[:verbose] = true }
  opts.on("-c", "--count N", Integer, "Repeat N times") { |n| options[:count] = n }
  opts.on("-nNAME", "--name=NAME", "Name to greet") { |n| options[:name] = n }
end

rest = parser.parse(%w[-v --count 3 --name=Ruby extra])
p options
p rest
