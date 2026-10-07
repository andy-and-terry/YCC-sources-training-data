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
    while i > 0
      sum += @tree[i]
      i -= i & -i
    end
    sum
  end

  def range_sum(from, to)
    prefix_sum(to) - (from.zero? ? 0 : prefix_sum(from - 1))
  end
end

fenwick = FenwickTree.new(8)
[3, 2, -1, 6, 5, 4, -3, 3].each_with_index do |value, i|
  fenwick.update(i, value)
end

puts fenwick.prefix_sum(5)   # sum of indices 0..5
puts fenwick.range_sum(2, 5) # sum of indices 2..5

fenwick.update(0, 10) # add 10 more to index 0
puts fenwick.prefix_sum(5)
