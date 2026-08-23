class CircularBuffer(T)
  def initialize(@capacity : Int32)
    @buffer = Array(T?).new(@capacity, nil)
    @head = 0
    @size = 0
  end

  def add(item : T)
    tail = (@head + @size) % @capacity
    @buffer[tail] = item
    if @size < @capacity
      @size += 1
    else
      @head = (@head + 1) % @capacity
    end
  end

  def to_a : Array(T)
    (0...@size).map { |i| @buffer[(@head + i) % @capacity].not_nil! }
  end
end

cb = CircularBuffer(Int32).new(3)
[1, 2, 3, 4, 5].each { |v| cb.add(v) }
puts cb.to_a.inspect
