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

int_stack = Stack(Int32).new
int_stack.push(1)
int_stack.push(2)
int_stack.push(3)
puts int_stack.pop
puts int_stack.peek
