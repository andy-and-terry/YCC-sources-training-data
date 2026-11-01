def twice
  yield 1
  yield 2
end

def map_with(arr : Array(Int32), &block : Int32 -> Int32)
  arr.map { |x| block.call(x) }
end

twice { |i| puts "got #{i}" }
puts map_with([1, 2, 3]) { |x| x * 10 }
