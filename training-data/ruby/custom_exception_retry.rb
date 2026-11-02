class FlakyError < StandardError; end

attempts = 0
begin
  attempts += 1
  raise FlakyError, "try #{attempts}" if attempts < 3
  puts "ok after #{attempts}"
rescue FlakyError => e
  puts e.message
  retry
end
