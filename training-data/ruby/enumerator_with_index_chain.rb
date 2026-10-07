words = %w[alpha beta gamma delta]

words.each_with_index { |w, i| puts "#{i}: #{w}" }
p words.map.with_index(1) { |w, i| "#{i}.#{w}" }
p words.each_with_index.select { |_, i| i.odd? }.map(&:first)
p words.each.with_object([]) { |w, acc| acc << w.size }
p words.zip(1..4).to_h
p words.cycle.first(6)
p words.each_entry.to_a.size

fib = Enumerator.new do |y|
  a, b = 0, 1
  loop { y << a; a, b = b, a + b }
end
p fib.take(10)
p fib.lazy.select(&:odd?).first(4)
e = words.each
puts e.next, e.next
p e.peek
