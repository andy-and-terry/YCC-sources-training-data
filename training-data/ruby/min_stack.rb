class MinStack
  def initialize
    @stack = []
    @min_stack = []
  end

  def push(value)
    @stack.push(value)
    current_min = @min_stack.empty? ? value : [value, @min_stack.last].min
    @min_stack.push(current_min)
  end

  def pop
    @min_stack.pop
    @stack.pop
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
puts s.min # 2
s.pop
puts s.min # 2
s.pop
puts s.min # 5
