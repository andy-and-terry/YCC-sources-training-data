class FibonacciIterator
  include Iterator(Int32)

  def initialize(@limit : Int32)
    @a = 0
    @b = 1
    @count = 0
  end

  def next
    return stop if @count >= @limit
    value = @a
    @a, @b = @b, @a + @b
    @count += 1
    value
  end
end

fib = FibonacciIterator.new(10)
puts fib.to_a.inspect

evens = FibonacciIterator.new(15).select { |n| n.even? }
puts evens.to_a.inspect
