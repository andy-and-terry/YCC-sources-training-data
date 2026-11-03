class RangeSum
  @prefix : Array(Int64)

  def initialize(values : Array(Int32))
    @prefix = [0_i64]
    values.each { |v| @prefix << @prefix.last + v }
  end

  def query(lo : Int32, hi : Int32) : Int64
    @prefix[hi] - @prefix[lo]
  end
end

puts RangeSum.new([3, 1, 4, 1, 5, 9, 2, 6]).query(2, 5)
