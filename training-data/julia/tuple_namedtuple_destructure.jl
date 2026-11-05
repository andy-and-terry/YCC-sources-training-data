nt = (name="ann", age=30)
(; name, age) = nt
println(name, " ", age)
a, b, rest... = 1, 2, 3, 4
println(a, b, rest)
println(nt.age + 1, keys(nt))
