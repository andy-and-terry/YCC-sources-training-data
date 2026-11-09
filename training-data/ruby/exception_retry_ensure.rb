attempts = 0
begin
  attempts += 1
  raise IOError, "flaky" if attempts < 3
  puts "ok after #{attempts}"
rescue IOError => e
  retry if attempts < 3
ensure
  puts "done"
end
