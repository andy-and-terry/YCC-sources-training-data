# retry with backoff counting, ensure ordering, and exception causes.
class TransientError < StandardError; end

attempts = 0
begin
  attempts += 1
  raise TransientError, "try #{attempts} failed" if attempts < 3
  puts "succeeded after #{attempts} attempts"
rescue TransientError => e
  puts "rescued: #{e.message}"
  retry if attempts < 3
ensure
  puts "ensure always runs"
end

def load_config
  Integer("not a number")
rescue ArgumentError => e
  raise RuntimeError, "config invalid"
end

begin
  load_config
rescue => e
  puts e.message
  puts e.cause.class
  puts e.cause.message
end

def with_else
  yield
rescue ZeroDivisionError
  :rescued
else
  :no_error
ensure
  puts "cleanup"
end
p with_else { 1 / 1 }
p with_else { 1 / 0 }
x = Integer("42") rescue 0
p x
