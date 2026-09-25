class RingDeque
  include Enumerable

  def initialize
    @buf = Array.new(4)
    @head = 0
    @size = 0
  end

  attr_reader :size

  def push_back(x)
    grow
    @buf[(@head + @size) % @buf.size] = x
    @size += 1
    self
  end

  def push_front(x)
    grow
    @head = (@head - 1) % @buf.size
    @buf[@head] = x
    @size += 1
    self
  end

  def pop_front
    return nil if @size.zero?

    x = @buf[@head]
    @buf[@head] = nil
    @head = (@head + 1) % @buf.size
    @size -= 1
    x
  end

  def pop_back
    return nil if @size.zero?

    @size -= 1
    i = (@head + @size) % @buf.size
    x = @buf[i]
    @buf[i] = nil
    x
  end

  def each(&) = @size.times { |i| yield @buf[(@head + i) % @buf.size] }

  private

  def grow
    return if @size < @buf.size

    @buf = to_a + Array.new(@buf.size)
    @head = 0
  end
end

d = RingDeque.new
5.times { |i| d.push_back(i).push_front(-i) }
p d.to_a
p [d.pop_front, d.pop_back, d.size, d.sum]
