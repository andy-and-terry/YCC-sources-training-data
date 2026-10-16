class TransientError < Exception
end

class FatalError < Exception
  def initialize(message = "fatal", @code : Int32 = 1)
    super(message)
  end

  getter code
end

attempts = 0

begin
  attempts += 1
  raise TransientError.new("flaky #{attempts}") if attempts < 3
  puts "succeeded after #{attempts} attempts"
rescue ex : TransientError
  puts "retrying: #{ex.message}"
  retry
end

begin
  raise FatalError.new("disk gone", 7)
rescue ex : FatalError
  puts "#{ex.message} (code #{ex.code})"
else
  puts "no error"
ensure
  puts "cleanup"
end
