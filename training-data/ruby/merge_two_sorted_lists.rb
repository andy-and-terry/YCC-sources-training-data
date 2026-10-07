class ListNode
  include Enumerable
  attr_accessor :val, :nxt

  def initialize(val, nxt = nil)
    @val = val
    @nxt = nxt
  end

  def each
    node = self
    while node
      yield node.val
      node = node.nxt
    end
  end
end

def from_array(a) = a.reverse.reduce(nil) { |nxt, v| ListNode.new(v, nxt) }

def merge(a, b)
  return b unless a
  return a unless b

  if a.val <= b.val
    a.nxt = merge(a.nxt, b)
    a
  else
    b.nxt = merge(a, b.nxt)
    b
  end
end

p merge(from_array([1, 2, 4, 9]), from_array([1, 3, 4, 5, 10])).to_a
