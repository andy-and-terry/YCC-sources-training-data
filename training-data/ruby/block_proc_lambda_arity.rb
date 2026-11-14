l = ->(a, b) { a + b }
pr = proc { |a, b| [a, b] }

p pr.call(1)
p pr.call(1, 2, 3)
begin
  l.call(1)
rescue ArgumentError => e
  puts e.message
end
