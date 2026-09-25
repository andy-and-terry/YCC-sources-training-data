class MovingAverage
  def initialize(size)
    @size = size
    @window = []
    @sum = 0.0
  end

  def next(value)
    @window << value
    @sum += value
    @sum -= @window.shift if @window.size > @size
    @sum / @window.size
  end
end

ma = MovingAverage.new(3)
puts [1, 10, 3, 5, 8, 2].map { |v| format("%.2f", ma.next(v)) }.join(" ")
