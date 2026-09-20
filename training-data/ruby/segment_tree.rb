class SegmentTree
  def initialize(values)
    @n = values.length
    @tree = Array.new(4 * @n, 0)
    build(values, 1, 0, @n - 1)
  end

  def query(left, right)
    query_range(1, 0, @n - 1, left, right)
  end

  def update(index, value)
    update_at(1, 0, @n - 1, index, value)
  end

  private

  def build(values, node, start, finish)
    if start == finish
      @tree[node] = values[start]
      return
    end
    mid = (start + finish) / 2
    build(values, 2 * node, start, mid)
    build(values, 2 * node + 1, mid + 1, finish)
    @tree[node] = @tree[2 * node] + @tree[2 * node + 1]
  end

  def query_range(node, start, finish, left, right)
    return 0 if right < start || finish < left
    return @tree[node] if left <= start && finish <= right

    mid = (start + finish) / 2
    query_range(2 * node, start, mid, left, right) +
      query_range(2 * node + 1, mid + 1, finish, left, right)
  end

  def update_at(node, start, finish, index, value)
    if start == finish
      @tree[node] = value
      return
    end
    mid = (start + finish) / 2
    if index <= mid
      update_at(2 * node, start, mid, index, value)
    else
      update_at(2 * node + 1, mid + 1, finish, index, value)
    end
    @tree[node] = @tree[2 * node] + @tree[2 * node + 1]
  end
end

tree = SegmentTree.new([1, 3, 5, 7, 9, 11])
puts tree.query(1, 3)
tree.update(1, 10)
puts tree.query(1, 3)
