class Greeter
  def greet(name) = "Hello, #{name}!"
end

m = Greeter.new.method(:greet)
puts m.call("Ann")
puts m.arity, m.name.inspect, m.owner
p %w[x y].map(&m)

um = m.unbind
puts um.bind(Greeter.new).call("Bob")

double = ->(x) { x * 2 }
inc = :succ.to_proc
puts (double >> inc).call(5)  # 11
puts (double << inc).call(5)  # 12
p [1, 2, 3].map(&10.method(:+))
