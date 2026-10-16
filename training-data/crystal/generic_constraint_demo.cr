def largest(items : Array(T)) : T forall T
  items.max
end

class Box(T)
  getter value : T

  def initialize(@value : T)
  end

  def map(&block : T -> U) : Box(U) forall U
    Box(U).new(yield @value)
  end
end

def sum_all(list : Enumerable(Number))
  list.sum
end

puts largest([3, 9, 2])
puts largest(["pear", "apple"])
b = Box.new(21).map { |x| x * 2 }.map(&.to_s)
puts b.value.inspect
puts sum_all([1, 2, 3.5])
