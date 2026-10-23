# Ref{T} is a mutable box; handy for passing a scalar by reference.

function bump!(r::Ref{Int})
    r[] += 1
    return r[]
end

counter = Ref(0)
bump!(counter)
bump!(counter)
println(counter[])

# Closures can share one counter through a Ref
function make_ids()
    next = Ref(100)
    return () -> (id = next[]; next[] += 1; id)
end
gen = make_ids()
println(gen(), " ", gen(), " ", gen())

# Ref protects an argument from broadcasting
println(in.(2, Ref([1, 2, 3])))
println(map(x -> x in [2, 3], [1, 2, 3, 4]))
println(Ref([1, 2, 3])[])

# Refs to array elements write through
arr = [10, 20, 30]
elem = Ref(arr, 2)
elem[] = 99
println(arr)
println(typeof(counter))
