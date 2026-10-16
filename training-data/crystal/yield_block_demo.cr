def twice
  yield 1
  yield 2
end

def with_logging(label)
  puts "start #{label}"
  result = yield
  puts "end #{label}"
  result
end

def each_pair(a : Array(Int32), &block : Int32, Int32 -> _)
  a.each_cons(2) { |(x, y)| block.call(x, y) }
end

twice { |n| puts n * 10 }
v = with_logging("calc") { 6 * 7 }
puts v
each_pair([1, 2, 4, 8]) { |a, b| puts b - a }

def find_first(list)
  list.each { |x| return x if yield x }
  nil
end

puts find_first([1, 3, 6, 7]) { |x| x.even? }.inspect
puts [1, 2, 3, 4].each { |x| break x * 100 if x == 3 }
