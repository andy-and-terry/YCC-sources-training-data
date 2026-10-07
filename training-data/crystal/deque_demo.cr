deque = Deque(Int32).new
deque.push(1)
deque.push(2)
deque.unshift(0)
puts deque.to_a.inspect
puts deque.shift
puts deque.pop
puts deque.to_a.inspect
