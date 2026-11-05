class Flaky < StandardError; end
attempts = 0
begin
  attempts += 1
  raise Flaky, "try #{attempts}" if attempts < 3
  puts "ok after #{attempts}"
rescue Flaky => e
  puts e.message
  retry
ensure
  puts "ensure ran"
end
