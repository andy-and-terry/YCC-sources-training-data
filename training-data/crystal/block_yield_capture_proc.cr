def twice
  yield; yield
end
n = 0
twice { n += 1 }
add = ->(a : Int32, b : Int32) { a + b }
puts n, add.call(2, 3)
