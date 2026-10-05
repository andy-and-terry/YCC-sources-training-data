struct Point
    x::Float64
    y::Float64
end

mutable struct Counter
    count::Int
end

increment!(c::Counter) = (c.count += 1; c)

p = Point(1.0, 2.0)
try
    p.x = 5.0
catch err
    println(typeof(err))
end

q = Point(p.x + 1, p.y)
println(q)

c = Counter(0)
increment!(c); increment!(c)
println(c.count)

d = c
d.count = 100
println(c.count, " ", c === d)
println(Point(1, 2) == Point(1.0, 2.0), " ", isimmutable(p), " ", ismutable(c))
