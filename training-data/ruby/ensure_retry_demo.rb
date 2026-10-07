class FlakyError < StandardError; end

def flaky_call(attempts_needed)
  @calls = (@calls || 0) + 1
  raise FlakyError, "attempt #{@calls} failed" if @calls < attempts_needed
  "ok after #{@calls} calls"
end

def with_retry(max: 3)
  tries = 0
  begin
    tries += 1
    yield
  rescue FlakyError => e
    puts "rescued: #{e.message}"
    retry if tries < max
    raise
  else
    puts "no error on try #{tries}"
  ensure
    puts "ensure ran (tries=#{tries})"
  end
end

puts with_retry { flaky_call(3) }

@calls = 0
begin
  with_retry(max: 2) { flaky_call(10) }
rescue FlakyError => e
  puts "gave up: #{e.class}"
end

def early_return
  return :from_body
ensure
  puts "cleanup before return"
end
puts early_return
