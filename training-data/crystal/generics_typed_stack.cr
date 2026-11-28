class Stack(T)
  def initialize; @items = [] of T; end
  def push(x : T); @items << x; self; end
  def pop : T?; @items.pop?; end
end

s = Stack(Int32).new.push(1).push(2)
puts s.pop
