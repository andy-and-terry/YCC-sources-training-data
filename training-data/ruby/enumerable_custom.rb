class NumberRange
  include Enumerable

  def initialize(from, to)
    @from = from
    @to = to
  end

  def each
    (@from..@to).each { |n| yield n }
  end
end

range = NumberRange.new(1, 10)
puts range.select(&:even?).inspect
puts range.map { |n| n * n }.inspect
puts range.reduce(:+)
