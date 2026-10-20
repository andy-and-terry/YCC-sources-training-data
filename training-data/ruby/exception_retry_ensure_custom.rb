class RetryableError < StandardError
  def initialize(msg = "temporary failure") = super
end

attempts = 0
begin
  attempts += 1
  raise RetryableError if attempts < 3
  puts "ok after #{attempts}"
rescue RetryableError => e
  puts "retry: #{e.message}"
  retry
ensure
  puts "ensure ran"
end

def checked
  yield
rescue ZeroDivisionError, TypeError => e
  puts "caught #{e.class}"
  :rescued
else
  :fine
end
puts checked { 1 / 0 }, checked { 1 }
