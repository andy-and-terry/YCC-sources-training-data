class Temp
  def initialize(c) = @c = c
  def f = @c * 9.0 / 5 + 32
  def k = @c + 273.15
  def to_s = "#{@c}C"
  def hot? = @c > 30
  def self.zero = new(0)
end

t = Temp.new(100)
puts t.f, t.k, t, t.hot?, Temp.zero
def square(x) = x * x
def greet(name = "world") = "hello #{name}"
def add(a, b:) = a + b
puts square(5), greet, greet("ann"), add(1, b: 2)
puts method(:square).arity, method(:add).parameters.inspect
def noisy(x) = puts("noisy #{x}")
noisy(3)
