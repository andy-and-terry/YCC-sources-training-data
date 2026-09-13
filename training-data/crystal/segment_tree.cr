class SegmentTree
  def initialize(data : Array(Int32))
    @n = data.size
    @tree = Array(Int32).new(4 * @n, 0)
    build(data, 1, 0, @n - 1)
  end

  private def build(data : Array(Int32), node : Int32, left : Int32, right : Int32)
    if left == right
      @tree[node] = data[left]
      return
    end
    mid = (left + right) // 2
    build(data, node * 2, left, mid)
    build(data, node * 2 + 1, mid + 1, right)
    @tree[node] = @tree[node * 2] + @tree[node * 2 + 1]
  end

  def query(query_left : Int32, query_right : Int32) : Int32
    query_range(1, 0, @n - 1, query_left, query_right)
  end

  private def query_range(node : Int32, left : Int32, right : Int32, ql : Int32, qr : Int32) : Int32
    return 0 if qr < left || right < ql
    return @tree[node] if ql <= left && right <= qr

    mid = (left + right) // 2
    query_range(node * 2, left, mid, ql, qr) + query_range(node * 2 + 1, mid + 1, right, ql, qr)
  end

  def update(index : Int32, value : Int32)
    update_at(1, 0, @n - 1, index, value)
  end

  private def update_at(node : Int32, left : Int32, right : Int32, index : Int32, value : Int32)
    if left == right
      @tree[node] = value
      return
    end
    mid = (left + right) // 2
    if index <= mid
      update_at(node * 2, left, mid, index, value)
    else
      update_at(node * 2 + 1, mid + 1, right, index, value)
    end
    @tree[node] = @tree[node * 2] + @tree[node * 2 + 1]
  end
end

data = [1, 3, 5, 7, 9, 11]
tree = SegmentTree.new(data)
puts tree.query(1, 3)
tree.update(1, 10)
puts tree.query(1, 3)
