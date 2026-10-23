squares = ntuple(i -> i^2, 5)
println(squares)
println(typeof(squares))

v = Val(3)
println(ntuple(i -> i * 10, v))

add10 = Base.Fix1(+, 10)
println(add10(5))

div_by_2 = Base.Fix2(/, 2)
println(div_by_2(9))

println(map(Base.Fix1(*, 3), [1, 2, 3]))
println(filter(Base.Fix2(>, 2), [1, 2, 3, 4]))
println(count(Base.Fix2(==, 'a'), "banana"))
