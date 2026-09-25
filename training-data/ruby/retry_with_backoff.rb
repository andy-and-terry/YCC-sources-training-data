class TransientError < StandardError; end

def with_retry(attempts: 5, base: 0.01, cap: 0.2, on: [TransientError])
  tries = 0
  begin
    tries += 1
    yield tries
  rescue *on => e
    raise if tries >= attempts

    delay = rand * [cap, base * 2**tries].min
    puts format('attempt %d failed (%s), sleeping %.3fs', tries, e.message, delay)
    sleep delay
    retry
  end
end

result = with_retry { |n| n < 4 ? raise(TransientError, 'timeout') : "ok after #{n}" }
puts result
begin
  with_retry(attempts: 2) { raise TransientError, 'still down' }
rescue TransientError => e
  puts "gave up: #{e.message}"
end
