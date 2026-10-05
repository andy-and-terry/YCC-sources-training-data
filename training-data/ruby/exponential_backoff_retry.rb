class FlakyService
  def initialize(failures)
    @failures = failures
  end

  def call
    if @failures > 0
      @failures -= 1
      raise IOError, "temporary failure"
    end
    "ok"
  end
end

def with_retry(max: 4, base: 0.01)
  attempts = 0
  begin
    attempts += 1
    yield
  rescue IOError => e
    raise if attempts >= max
    delay = base * 2**(attempts - 1)
    puts "attempt #{attempts} failed (#{e.message}), retry in #{delay}s"
    sleep delay
    retry
  end
end

svc = FlakyService.new(2)
puts with_retry { svc.call }
begin
  bad = FlakyService.new(5)
  with_retry(max: 2) { bad.call }
rescue IOError => e
  puts "gave up: #{e.message}"
end
