class Countdown
  include Iterator(Int32)

  def initialize(@current : Int32)
  end

  def next
    return stop if @current < 0
    value = @current
    @current -= 1
    value
  end
end

puts Countdown.new(5).to_a.inspect
puts Countdown.new(10).select(&.even?).map { |n| n * n }.to_a.inspect

evens = (1..).each.select(&.even?).first(4)
puts evens.inspect
puts Countdown.new(6).with_index.map { |n, i| n * i }.to_a.inspect
puts Countdown.new(4).zip(%w[a b c d e]).to_a.inspect
