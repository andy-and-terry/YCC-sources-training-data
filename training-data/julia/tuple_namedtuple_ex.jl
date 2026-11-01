t = (1, "two", 3.0)
a, b, c = t
println(a, b, c)
nt = (name="ann", age=30)
println(nt.name, " ", nt[:age])
println(merge(nt, (age=31,)))
f(; x=1, y=2) = x + y
println(f(y=10))
