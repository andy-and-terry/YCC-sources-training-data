class DNode
  attr_accessor :value, :prev, :nxt

  def initialize(value)
    @value = value
    @prev = nil
    @nxt = nil
  end
end

class DoublyLinkedList
  include Enumerable

  def initialize
    @head = nil
    @tail = nil
  end

  def push_back(value)
    node = DNode.new(value)
    if @tail
      node.prev = @tail
      @tail.nxt = node
      @tail = node
    else
      @head = @tail = node
    end
    self
  end

  def push_front(value)
    node = DNode.new(value)
    if @head
      node.nxt = @head
      @head.prev = node
      @head = node
    else
      @head = @tail = node
    end
    self
  end

  def each
    node = @head
    while node
      yield node.value
      node = node.nxt
    end
  end

  def each_reverse
    node = @tail
    while node
      yield node.value
      node = node.prev
    end
  end
end

list = DoublyLinkedList.new
[1, 2, 3].each { |v| list.push_back(v) }
list.push_front(0)

puts list.to_a.inspect
reversed = []
list.each_reverse { |v| reversed << v }
puts reversed.inspect
