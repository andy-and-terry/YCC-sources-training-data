class AppError < Exception
  getter code : Int32

  def initialize(message : String, @code : Int32 = 1)
    super(message)
  end
end

class NotFound < AppError
  def initialize(what : String)
    super("#{what} not found", 404)
  end
end

def find(id : Int32)
  raise NotFound.new("user #{id}") if id > 10
  raise ArgumentError.new("negative") if id < 0
  "user#{id}"
end

[5, 50, -1].each do |id|
  begin
    puts find(id)
  rescue e : NotFound
    puts "404: #{e.message} code=#{e.code}"
  rescue e : ArgumentError | AppError
    puts "other: #{e.message}"
  else
    puts "no error"
  ensure
    puts "checked #{id}"
  end
end

def retry_it(times = 3)
  attempts = 0
  begin
    attempts += 1
    raise "flaky" if attempts < times
    "succeeded after #{attempts}"
  rescue
    retry if attempts < times
  end
end
puts retry_it
puts (Int32.new("x") rescue "bad int")
puts [1, 2].fetch(5) { |i| "no index #{i}" }
