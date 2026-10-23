# Limiting how long a block may run with Timeout.timeout.
require "timeout"

def slow_task(seconds)
  sleep(seconds)
  "finished after #{seconds}s"
end

def with_limit(limit, seconds)
  Timeout.timeout(limit) { slow_task(seconds) }
rescue Timeout::Error => e
  "gave up: #{e.message}"
end

puts with_limit(1, 0.05)
puts with_limit(0.1, 2)

class FetchTimeout < StandardError; end

begin
  Timeout.timeout(0.1, FetchTimeout, "custom fetch timeout") { sleep 1 }
rescue FetchTimeout => e
  puts "#{e.class}: #{e.message}"
end

# ensure still runs when the timeout fires
begin
  Timeout.timeout(0.1) do
    begin
      sleep 1
    ensure
      puts "cleanup ran"
    end
  end
rescue Timeout::Error
  puts "timed out"
end
