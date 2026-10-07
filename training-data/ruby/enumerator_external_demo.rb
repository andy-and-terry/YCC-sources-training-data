e = [10, 20, 30].each
puts e.next, e.next, e.next
begin
  e.next
rescue StopIteration
  puts "done"
end

fib = Enumerator.new do |y|
  a, b = 0, 1
  loop do
    y << a
    a, b = b, a + b
  end
end
p fib.take(10)
p fib.lazy.select(&:even?).first(5)

p %w[a b c].each_with_index.map { |s, i| "#{i}:#{s}" }
p %w[a b c].each.with_index(1).to_a
puts [1, 2, 3].cycle.take(7).inspect
p (1..3).each_entry.to_a
