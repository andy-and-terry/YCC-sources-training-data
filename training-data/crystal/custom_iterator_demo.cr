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
puts Countdown.new(6).with_index.map { |v, i| v * i }.to_a.inspect

puts Countdown.new(4).zip(Countdown.new(9)).to_a.inspect
