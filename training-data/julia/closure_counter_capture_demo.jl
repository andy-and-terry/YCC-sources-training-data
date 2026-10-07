function make_counter(start=0; step=1)
    count = start
    increment() = (count += step)
    reset() = (count = start)
    return increment, reset
end

inc, reset = make_counter(10; step=5)
println(inc(), " ", inc(), " ", inc())
reset()
println(inc())

adders = [x -> x + i for i in 1:3]
println([f(10) for f in adders])

function make_accumulator()
    total = 0
    return x -> (total += x; total)
end
acc = make_accumulator()
acc(5)
acc(10)
println(acc(0))

# captured variables are shared between closures created in the same scope
function shared_state()
    n = 0
    bump() = (n += 1)
    peek() = n
    return bump, peek
end
bump, peek = shared_state()
bump(); bump()
println(peek())

# let blocks create a fresh binding per iteration
fs = Function[]
for i in 1:3
    let j = i
        push!(fs, () -> j * j)
    end
end
println([f() for f in fs])
println(typeof(inc) <: Function, isconcretetype(typeof(inc)))
