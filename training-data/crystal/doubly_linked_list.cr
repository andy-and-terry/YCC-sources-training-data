class DListNode(T)
  property value : T
  property prev : DListNode(T)?
  property next : DListNode(T)?

  def initialize(@value : T)
  end
end

class DoublyLinkedList(T)
  def initialize
    @head = nil.as(DListNode(T)?)
    @tail = nil.as(DListNode(T)?)
  end

  def push_back(value : T)
    node = DListNode(T).new(value)
    if tail = @tail
      tail.next = node
      node.prev = tail
      @tail = node
    else
      @head = node
      @tail = node
    end
  end

  def push_front(value : T)
    node = DListNode(T).new(value)
    if head = @head
      head.prev = node
      node.next = head
      @head = node
    else
      @head = node
      @tail = node
    end
  end

  def to_a : Array(T)
    result = [] of T
    node = @head
    while node
      result << node.value
      node = node.next
    end
    result
  end
end

list = DoublyLinkedList(Int32).new
list.push_back(2)
list.push_back(3)
list.push_front(1)
puts list.to_a.inspect
