class AppError < StandardError
  def initialize(msg = "app failed") = super
end

class CodeError < AppError
  attr_reader :code

  def initialize(code)
    @code = code
    super("failed with code #{code}")
  end
end

begin
  raise AppError
rescue => e
  puts e.message, e.class, e.is_a?(StandardError)
end

begin
  raise CodeError.new(42)
rescue AppError => e
  puts e.message, e.code
  puts e.backtrace.first.sub(/^.*?:/, "").class
  puts e.full_message(highlight: false).lines.first.sub(/^.*?: /, "")
end

e = RuntimeError.new("boom")
puts e.backtrace.inspect, e.message, e.inspect
puts (raise "x" rescue $!.class)
puts AppError.ancestors.take(3).inspect
puts CodeError.new(1).detailed_message
