def run
  yield 1, 2
end

run { |a, b| puts a + b }
l = ->(a, b) { a * b }
pr = proc { |a, b| [a, b] }
p l.call(2, 3), pr.call(1), pr.call(1, 2, 3)
begin
  l.call(1)
rescue ArgumentError => e
  puts e.message
end
