class Range3
  include Enumerable(Int32)

  def initialize(@from : Int32, @to : Int32, @step : Int32)
  end

  def each
    value = @from
    while value <= @to
      yield value
      value += @step
    end
  end
end

evens = Range3.new(0, 20, 2)
puts evens.to_a.inspect
puts evens.select { |n| n % 4 == 0 }.inspect
puts evens.sum
puts evens.map { |n| n * n }.inspect
puts evens.find { |n| n > 10 }
