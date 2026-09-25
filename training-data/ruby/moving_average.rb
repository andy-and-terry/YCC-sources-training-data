class MovingAverage
  def initialize(size)
    @size = size
    @window = []
    @sum = 0.0
  end

  def <<(x)
    @window << x
    @sum += x
    @sum -= @window.shift if @window.size > @size
    self
  end

  def value = @sum / @window.size
end

prices = [10, 11, 12, 13, 12, 11, 15, 18, 17, 16]
sma = MovingAverage.new(3)
ema = nil
prices.each do |p|
  ema = ema ? 0.5 * p + 0.5 * ema : p.to_f
  puts format('%5.1f  sma=%7.3f  ema=%7.3f', p, (sma << p).value, ema)
end
p prices.each_cons(3).map { |w| (w.sum / 3.0).round(3) }
