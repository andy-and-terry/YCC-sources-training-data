class MinStack
  def initialize
    @items = []
  end

  def push(x)
    m = @items.empty? ? x : [x, @items.last[1]].min
    @items << [x, m]
    self
  end

  def pop = @items.pop.first
  def min = @items.last[1]
end

s = MinStack.new
[5, 3, 7, 2].each { |v| s.push(v) }
puts s.min
s.pop
puts s.min
