class PriorityQueue(T)
  def initialize
    @heap = [] of T
  end

  def empty? : Bool
    @heap.empty?
  end

  def size : Int32
    @heap.size
  end

  def push(value : T)
    @heap << value
    sift_up(@heap.size - 1)
  end

  def pop : T?
    return nil if @heap.empty?
    top = @heap[0]
    last = @heap.pop
    unless @heap.empty?
      @heap[0] = last
      sift_down(0)
    end
    top
  end

  private def sift_up(index : Int32)
    child = index
    while child > 0
      parent = (child - 1) // 2
      break if @heap[parent] <= @heap[child]
      @heap[parent], @heap[child] = @heap[child], @heap[parent]
      child = parent
    end
  end

  private def sift_down(index : Int32)
    parent = index
    loop do
      left = 2 * parent + 1
      right = 2 * parent + 2
      smallest = parent
      smallest = left if left < @heap.size && @heap[left] < @heap[smallest]
      smallest = right if right < @heap.size && @heap[right] < @heap[smallest]
      break if smallest == parent
      @heap[parent], @heap[smallest] = @heap[smallest], @heap[parent]
      parent = smallest
    end
  end
end

pq = PriorityQueue(Int32).new
[5, 1, 8, 2, 9, 3].each { |v| pq.push(v) }
result = [] of Int32
result << pq.pop.not_nil! until pq.empty?
puts result.inspect
