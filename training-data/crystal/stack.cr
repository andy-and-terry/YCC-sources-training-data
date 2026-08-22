class Stack(T)
  def initialize
    @items = [] of T
  end

  def push(item : T)
    @items.push(item)
  end

  def pop : T?
    @items.pop?
  end

  def peek : T?
    @items.last?
  end

  def empty? : Bool
    @items.empty?
  end
end

stack = Stack(Int32).new
stack.push(1)
stack.push(2)
stack.push(3)
puts "#{stack.pop} #{stack.peek} #{stack.empty?}"
