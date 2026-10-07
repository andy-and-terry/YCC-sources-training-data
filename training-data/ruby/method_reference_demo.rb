class Calculator
  def double(x) = x * 2
  def square(x) = x * x
end

calc = Calculator.new
m = calc.method(:double)
puts [1, 2, 3].map(&m).inspect
puts m.arity
puts m.owner

composed = calc.method(:double) >> calc.method(:square)
puts composed.call(3)
puts (calc.method(:double) << calc.method(:square)).call(3)

puts %w[1 2 3].map(&method(:Integer)).inspect
puts [[1, 2], [3, 4]].map { |a, b| a * b }.inspect

um = Calculator.instance_method(:square)
puts um.bind(calc).call(7)
puts calc.respond_to?(:double)
puts Calculator.instance_methods(false).sort.inspect
