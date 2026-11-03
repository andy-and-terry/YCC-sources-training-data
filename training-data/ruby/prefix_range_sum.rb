class RangeSum
  def initialize(values)
    @prefix = values.each_with_object([0]) { |v, acc| acc << acc.last + v }
  end

  def query(lo, hi)
    @prefix[hi] - @prefix[lo]
  end
end

puts RangeSum.new([3, 1, 4, 1, 5, 9, 2, 6]).query(2, 5)
