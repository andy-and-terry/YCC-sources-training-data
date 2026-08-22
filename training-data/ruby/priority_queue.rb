class PriorityQueue
  def initialize
    @items = []
  end

  def push(item, priority)
    @items << [priority, item]
    @items.sort_by! { |p, _| p }
  end

  def pop
    @items.shift&.last
  end
end

pq = PriorityQueue.new
pq.push('low', 5)
pq.push('high', 1)
pq.push('medium', 3)
puts [pq.pop, pq.pop, pq.pop].inspect
