add = ->(a, b) { a + b }
sq = proc { |x| x * x }
def apply_twice(f, x) = f.(f.(x))
puts add.(1, 2), apply_twice(sq, 3)
puts [1, 2, 3].map(&sq).inspect
