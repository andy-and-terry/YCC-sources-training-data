# Tuples are immutable, fixed-size, and fully typed. ntuple builds them
# from a function of the index, and many collection functions accept them.
squares = ntuple(i -> i^2, 5)
println(squares)
println(typeof(squares))

zeros3 = ntuple(_ -> 0, Val(3))
println(zeros3)

t = (10, "two", 3.0)
println(length(t), " ", t[2], " ", t[end])
println(Base.tail(t))
println(first(t), " ", last(t))
println((t..., :extra))

# Tuples are compared lexicographically.
println((1, 2, 3) < (1, 2, 4))
println(sort([(2, "b"), (1, "z"), (2, "a")]))

# map over tuples returns a tuple.
println(map(x -> x * 2, (1, 2, 3)))
println(map(+, (1, 2), (10, 20)))

# Swapping with tuple destructuring.
a, b = 1, 2
a, b = b, a
println((a, b))

# Named tuples carry field names but behave like tuples.
point = (x = 1.5, y = -2.0)
println(point.x, " ", point[:y], " ", keys(point))
println(merge(point, (z = 0.0,)))
