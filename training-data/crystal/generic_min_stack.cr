class MinStack(T)
  def initialize
    @items = [] of {T, T}
  end

  def push(x : T)
    m = @items.empty? ? x : {x, @items.last[1]}.min
    @items << {x, m}
  end

  def pop : T
    @items.pop[0]
  end

  def min : T
    @items.last[1]
  end
end

s = MinStack(Int32).new
[5, 3, 7, 2].each { |v| s.push(v) }
puts s.min
s.pop
puts s.min
