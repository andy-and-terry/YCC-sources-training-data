def run
  yield 1, 2
end

run { |a, b| puts a + b }

l = ->(x) { x * 2 }
pr = proc { |x, y| "#{x.inspect},#{y.inspect}" }
puts l.call(4)
puts pr.call(1)
puts pr.call(1, 2, 3)
puts l.lambda?, pr.lambda?
