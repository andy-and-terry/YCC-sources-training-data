ENV["DEMO_MODE"] = "debug"
ENV["DEMO_COUNT"] = "3"

puts ENV["DEMO_MODE"]
puts ENV.fetch("DEMO_MISSING", "fallback")
puts ENV["DEMO_MISSING"]?.inspect
puts ENV["DEMO_COUNT"].to_i * 2
puts ENV.has_key?("DEMO_MODE")

ENV.delete("DEMO_MODE")
puts ENV.has_key?("DEMO_MODE")

begin
  ENV["DEMO_MISSING"]
rescue ex : KeyError
  puts "KeyError raised"
end
