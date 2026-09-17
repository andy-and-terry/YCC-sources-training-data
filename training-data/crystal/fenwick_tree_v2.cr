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
    i = index + 1
    total = 0
    while i > 0
      total += @tree[i]
      i -= i & (-i)
    end
    total
  end

  def range_sum(left : Int32, right : Int32) : Int32
    left > 0 ? prefix_sum(right) - prefix_sum(left - 1) : prefix_sum(right)
  end
end

values = [1, 3, 5, 7, 9, 11]
tree = FenwickTree.new(values.size)
values.each_with_index { |v, i| tree.add(i, v) }
puts tree.range_sum(1, 3)
tree.add(1, 10)
puts tree.range_sum(1, 3)
