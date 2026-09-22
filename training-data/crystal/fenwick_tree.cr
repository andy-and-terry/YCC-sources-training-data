class FenwickTree
  def initialize(size : Int32)
    @size = size
    @tree = Array.new(size + 1, 0)
  end

  def add(index : Int32, delta : Int32)
    i = index + 1
    while i <= @size
      @tree[i] += delta
      i += i & (-i)
    end
  end

  def prefix_sum(index : Int32) : Int32
    total = 0
    i = index + 1
    while i > 0
      total += @tree[i]
      i -= i & (-i)
    end
    total
  end

  def range_sum(left : Int32, right : Int32) : Int32
    prefix_sum(right) - (left > 0 ? prefix_sum(left - 1) : 0)
  end
end

ft = FenwickTree.new(6)
[1, 3, 5, 7, 9, 11].each_with_index { |v, i| ft.add(i, v) }
puts ft.range_sum(1, 3)
puts ft.prefix_sum(5)
