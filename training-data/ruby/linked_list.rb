class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = nil
    @tail = nil
  end

  def push(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
    self
  end

  def each
    node = @head
    while node
      yield node.value
      node = node.next_node
    end
  end

  def reverse!
    prev = nil
    current = @head
    @tail = @head
    while current
      nxt = current.next_node
      current.next_node = prev
      prev = current
      current = nxt
    end
    @head = prev
    self
  end

  def to_s
    to_a.join(' -> ')
  end
end

list = LinkedList.new
list.push(1).push(2).push(3)
puts list.to_s          # 1 -> 2 -> 3
puts list.map { |v| v * 10 }.inspect
list.reverse!
puts list.to_s          # 3 -> 2 -> 1
