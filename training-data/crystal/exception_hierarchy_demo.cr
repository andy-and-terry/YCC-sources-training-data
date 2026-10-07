class AppError < Exception
end

class ValidationError < AppError
  def initialize(field : String)
    super("invalid value for #{field}")
  end
end

class NotFoundError < AppError
  def initialize(id : Int32)
    super("record #{id} not found")
  end
end

def lookup(id : Int32) : String
  raise ValidationError.new("id") if id < 0
  raise NotFoundError.new(id) if id > 100
  "record-#{id}"
end

[5, -1, 200].each do |id|
  begin
    puts lookup(id)
  rescue ex : ValidationError
    puts "validation failed: #{ex.message}"
  rescue ex : NotFoundError
    puts "not found: #{ex.message}"
  rescue ex : AppError
    puts "app error: #{ex.message}"
  end
end
