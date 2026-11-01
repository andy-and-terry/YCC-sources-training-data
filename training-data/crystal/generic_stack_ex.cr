class Stack(T)
  def initialize; @items = [] of T; end
  def push(x : T); @items.push(x); self; end
  def pop : T?; @items.pop?; end
  def size = @items.size
end

s = Stack(String).new
s.push("a").push("b")
puts s.pop
puts s.size
