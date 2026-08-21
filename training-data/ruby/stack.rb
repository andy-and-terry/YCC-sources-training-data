class Stack
  def initialize
    @items = []
  end

  def push(item)
    @items.push(item)
  end

  def pop
    @items.pop
  end

  def peek
    @items.last
  end

  def empty?
    @items.empty?
  end
end

s = Stack.new
s.push(1)
s.push(2)
s.push(3)
puts "#{s.pop} #{s.peek} #{s.empty?}"
