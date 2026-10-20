module Describable
  def describe : String
    "#{self.class.name}: #{name}"
  end
end

module Countable(T)
  def count_items(items : Array(T)) : Int32
    items.size
  end
end

class Stack(T)
  include Enumerable(T)

  def initialize
    @items = [] of T
  end

  def push(item : T)
    @items.push(item)
    self
  end

  def pop? : T?
    @items.pop?
  end

  def each(& : T ->)
    @items.each { |i| yield i }
  end
end

class Dog
  include Describable
  getter name = "Rex"
end

s = Stack(Int32).new.push(3).push(1).push(2)
puts s.sort.inspect, s.map { |x| x * 2 }.inspect, s.includes?(1), s.min, s.sum
puts s.pop?, Stack(String).new.pop?.inspect
puts Dog.new.describe
def largest(a : Array(T)) : T forall T
  a.max
end
puts largest([3, 9, 4]), largest(["b", "z"])
