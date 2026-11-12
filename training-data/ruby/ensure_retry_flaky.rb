attempts = 0
begin
  attempts += 1
  raise "flaky" if attempts < 3
  puts "ok after #{attempts}"
rescue
  retry if attempts < 5
ensure
  puts "done"
end
