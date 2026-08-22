class CircularBuffer
  def initialize(capacity)
    @capacity = capacity
    @buffer = Array.new(capacity)
    @head = 0
    @size = 0
  end

  def append(item)
    tail = (@head + @size) % @capacity
    @buffer[tail] = item
    if @size < @capacity
      @size += 1
    else
      @head = (@head + 1) % @capacity
    end
  end

  def to_a
    (0...@size).map { |i| @buffer[(@head + i) % @capacity] }
  end
end

cb = CircularBuffer.new(3)
5.times { |i| cb.append(i) }
puts cb.to_a.inspect
