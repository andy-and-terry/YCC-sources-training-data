class Stack(T)
  def initialize; @items = [] of T; end
  def push(x : T); @items << x; self; end
  def pop : T?; @items.pop?; end
  def size; @items.size; end
end

s = Stack(Int32).new
s.push(1).push(2)
puts s.pop
puts s.size
