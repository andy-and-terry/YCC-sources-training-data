class FenwickTree
  def initialize(size)
    @tree = Array.new(size + 1, 0)
  end

  def update(index, delta)
    i = index + 1
    while i < @tree.length
      @tree[i] += delta
      i += i & -i
    end
  end

  def prefix_sum(index)
    sum = 0
    i = index + 1
    while i.positive?
      sum += @tree[i]
      i -= i & -i
    end
    sum
  end

  def range_sum(from, to)
    prefix_sum(to) - (from.zero? ? 0 : prefix_sum(from - 1))
  end
end

fenwick = FenwickTree.new(6)
[1, 3, 5, 7, 9, 11].each_with_index { |v, i| fenwick.update(i, v) }
puts fenwick.range_sum(1, 3)
fenwick.update(1, 7)
puts fenwick.range_sum(1, 3)
