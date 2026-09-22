mutable struct Counter
    count::Int
end

(c::Counter)() = (c.count += 1; c.count)
(c::Counter)(step::Int) = (c.count += step; c.count)

counter = Counter(0)
println(counter())
println(counter())
println(counter(5))
println(counter.count)
