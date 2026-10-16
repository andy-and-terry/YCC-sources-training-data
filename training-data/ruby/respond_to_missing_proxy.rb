class Recorder < BasicObject
  def initialize = @calls = []

  def method_missing(name, *args, &blk)
    @calls << [name, args]
    self
  end

  def respond_to_missing?(*) = true

  def __calls = @calls
end

r = Recorder.new
r.foo(1).bar(2, 3).baz
puts r.__calls.inspect

class Ghost
  def method_missing(name, *args)
    return "ghost_#{name}" if name.start_with?("get_")
    super
  end

  def respond_to_missing?(name, include_private = false) = name.start_with?("get_") || super
end

g = Ghost.new
puts g.get_x, g.respond_to?(:get_y), g.respond_to?(:other)
puts g.method(:get_z).call
begin
  g.other
rescue NoMethodError => e
  puts "NoMethodError"
end
