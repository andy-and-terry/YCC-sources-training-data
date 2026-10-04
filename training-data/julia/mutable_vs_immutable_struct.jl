struct Point
    x::Float64
    y::Float64
end

mutable struct Counter
    count::Int
end

increment!(c::Counter) = (c.count += 1; c)

p = Point(1.0, 2.0)
println(p)
try
    p.x = 5.0
catch e
    println(typeof(e))
end

c = Counter(0)
increment!(c); increment!(c)
println(c.count)

q = Point(p.x + 1, p.y)
println(q, " ", p == Point(1.0, 2.0), " ", p === Point(1.0, 2.0))
println(isbits(p), " ", ismutable(c))
