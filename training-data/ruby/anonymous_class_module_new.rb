Greeter = Class.new do
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hello, #{name}"
  end
end
puts Greeter.new("Ada").greet

anon = Class.new(StandardError) { def message = "anonymous failure" }
puts anon.name.inspect
begin
  raise anon
rescue => e
  puts e.message
end

Loud = Module.new do
  def greet
    super.upcase + "!"
  end
end
Greeter.prepend(Loud)
puts Greeter.new("Grace").greet
puts Greeter.ancestors.first(3).inspect

klass = Class.new(Greeter)
klass.define_method(:farewell) { "Bye, #{name}" }
puts klass.new("Linus").farewell
