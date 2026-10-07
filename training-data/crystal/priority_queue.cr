class PriorityQueue(T)
  def initialize
    @heap = [] of T
  end

  def push(item : T)
    @heap << item
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

  def peek : T?
    @heap.first?
  end

  def empty? : Bool
    @heap.empty?
  end

  def size : Int32
    @heap.size
  end

  private def sift_up(index : Int32)
    while index > 0
      parent = (index - 1) // 2
      break if @heap[parent] <= @heap[index]
      @heap[parent], @heap[index] = @heap[index], @heap[parent]
      index = parent
    end
  end

  private def sift_down(index : Int32)
    size = @heap.size
    loop do
      smallest = index
      left = index * 2 + 1
      right = index * 2 + 2
      smallest = left if left < size && @heap[left] < @heap[smallest]
      smallest = right if right < size && @heap[right] < @heap[smallest]
      break if smallest == index
      @heap[index], @heap[smallest] = @heap[smallest], @heap[index]
      index = smallest
    end
  end
end

pq = PriorityQueue(Int32).new
[5, 1, 8, 2, 9, 3].each { |n| pq.push(n) }
result = [] of Int32
result << pq.pop.not_nil! until pq.empty?
puts result.inspect
