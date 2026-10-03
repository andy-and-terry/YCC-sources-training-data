class MinStack
  def initialize
    @stack = [] of Int32
    @min_stack = [] of Int32
  end

  def push(value : Int32)
    @stack.push(value)
    if @min_stack.empty? || value <= @min_stack.last
      @min_stack.push(value)
    end
  end

  def pop
    top = @stack.pop
    @min_stack.pop if top == @min_stack.last
    top
  end

  def top
    @stack.last
  end

  def min
    @min_stack.last
  end
end

s = MinStack.new
s.push(5)
s.push(2)
s.push(7)
puts s.min
s.pop
puts s.min
