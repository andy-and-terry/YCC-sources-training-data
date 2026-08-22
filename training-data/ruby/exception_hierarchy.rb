class ApiError < StandardError; end
class NotFoundError < ApiError
  def initialize(resource)
    super("#{resource} not found")
  end
end
class ValidationError < ApiError
  def initialize(field, message)
    super("invalid field '#{field}': #{message}")
  end
end

def fetch_resource(id)
  raise ValidationError.new('id', 'must be non-negative') if id.negative?
  raise NotFoundError, "resource #{id}" if id > 100
end

begin
  fetch_resource(999)
rescue ApiError => e
  puts "error: #{e.message}"
end

begin
  fetch_resource(-1)
rescue ApiError => e
  puts "error: #{e.message}"
end
