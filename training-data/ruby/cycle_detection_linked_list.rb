Node = Struct.new(:value, :next_node)

def build(values, loop_to: nil)
  nodes = values.map { |v| Node.new(v) }
  nodes.each_cons(2) { |a, b| a.next_node = b }
  nodes.last.next_node = nodes[loop_to] if loop_to
  nodes.first
end

# Floyd's tortoise and hare: returns [start value, cycle length] or nil.
def find_cycle(head)
  slow = fast = head
  while fast&.next_node
    slow = slow.next_node
    fast = fast.next_node.next_node
    next unless slow.equal?(fast)

    length = 1
    probe = slow.next_node
    until probe.equal?(slow)
      probe = probe.next_node
      length += 1
    end
    slow = head
    until slow.equal?(fast)
      slow = slow.next_node
      fast = fast.next_node
    end
    return [slow.value, length]
  end
  nil
end

# Simpler alternative that remembers visited nodes by identity (O(n) memory).
def find_cycle_start_with_set(head)
  seen = {}.compare_by_identity
  node = head
  while node
    return node.value if seen.key?(node)

    seen[node] = true
    node = node.next_node
  end
  nil
end

list = build([3, 2, 0, -4], loop_to: 1)
p find_cycle(list), find_cycle_start_with_set(list)
p find_cycle(build([1, 2, 3])), find_cycle_start_with_set(build([1, 2, 3]))
