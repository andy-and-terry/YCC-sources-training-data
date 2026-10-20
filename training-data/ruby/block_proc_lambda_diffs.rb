l = ->(a, b) { a + b }
pr = proc { |a, b| [a, b] }
puts pr.call(1).inspect, pr.call(1, 2, 3).inspect, l.arity, pr.arity
begin
  l.call(1)
rescue ArgumentError => e
  puts e.message
end

def run
  [1, 2, 3].each { |x| return x if x == 2 }
  :never
end
puts run
puts (l >> ->(x) { x * 10 }).call(1, 2)
