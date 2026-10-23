ENV["DEMO_MODE"] = "test"

puts ENV["DEMO_MODE"]
puts ENV.fetch("DEMO_MISSING", "fallback")
puts ENV.fetch("DEMO_MISSING") { |k| "no #{k}" }
puts ENV.key?("DEMO_MODE")

begin
  ENV.fetch("DEMO_MISSING")
rescue KeyError => e
  puts "KeyError: #{e.message}"
end

ENV.delete("DEMO_MODE")
p ENV["DEMO_MODE"]
