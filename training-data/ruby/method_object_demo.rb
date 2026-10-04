class Greeter
  def initialize(greeting)
    @greeting = greeting
  end

  def greet(name, punctuation = "!")
    "#{@greeting}, #{name}#{punctuation}"
  end
end

g = Greeter.new("Hello")
m = g.method(:greet)
puts m.call("Ann")
puts m.arity
puts m.owner, m.name.inspect, m.receiver.class
puts m.parameters.inspect

um = m.unbind
other = Greeter.new("Howdy")
puts um.bind(other).call("Bob", "?")

puts %w[x y].map(&g.method(:greet)).inspect

compose = g.method(:greet) >> :upcase.to_proc
puts compose.call("cy")

puts Greeter.instance_method(:greet).source_location.class
puts g.public_methods(false).inspect
puts g.respond_to?(:greet), g.public_send(:greet, "Di")
puts 5.method(:+).to_proc.call(6)
