# rescue / retry / else / ensure flow, with a custom error class.
class TransientError < StandardError; end

attempts = 0
begin
  attempts += 1
  raise TransientError, "try #{attempts}" if attempts < 3
  puts "succeeded after #{attempts} attempts"
rescue TransientError => e
  puts "rescued #{e.message}"
  retry if attempts < 3
else
  puts "no further errors"
ensure
  puts "cleanup always runs"
end
