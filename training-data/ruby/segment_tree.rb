class SegmentTree
  def initialize(array)
    @n = array.size
    @tree = Array.new(4 * @n, 0)
    build(array, 0, 0, @n - 1)
  end

  def query(left, right)
    query_range(0, 0, @n - 1, left, right)
  end

  def update(index, value)
    update_index(0, 0, @n - 1, index, value)
  end

  private

  def build(array, node, start, finish)
    if start == finish
      @tree[node] = array[start]
      return
    end

    mid = (start + finish) / 2
    build(array, 2 * node + 1, start, mid)
    build(array, 2 * node + 2, mid + 1, finish)
    @tree[node] = @tree[2 * node + 1] + @tree[2 * node + 2]
  end

  def query_range(node, start, finish, left, right)
    return 0 if right < start || finish < left
    return @tree[node] if left <= start && finish <= right

    mid = (start + finish) / 2
    query_range(2 * node + 1, start, mid, left, right) +
      query_range(2 * node + 2, mid + 1, finish, left, right)
  end

  def update_index(node, start, finish, index, value)
    if start == finish
      @tree[node] = value
      return
    end

    mid = (start + finish) / 2
    if index <= mid
      update_index(2 * node + 1, start, mid, index, value)
    else
      update_index(2 * node + 2, mid + 1, finish, index, value)
    end
    @tree[node] = @tree[2 * node + 1] + @tree[2 * node + 2]
  end
end

tree = SegmentTree.new([1, 3, 5, 7, 9, 11])
puts tree.query(1, 3)
tree.update(1, 10)
puts tree.query(1, 3)
