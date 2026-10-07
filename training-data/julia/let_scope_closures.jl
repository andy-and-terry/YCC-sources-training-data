function make_counter()
    count = 0
    return () -> (count += 1)
end

c = make_counter()
println(c(), c(), c())

x = 10
let x = 1
    println("inner ", x)
end
println("outer ", x)

adders = [i -> i + k for k in 1:3]
println([f(10) for f in adders])

function outer()
    y = 1
    function inner()
        y += 1
    end
    inner(); inner()
    y
end
println(outer())

for i in 1:2
    z = i * 2
end
println(@isdefined(z))
global g = 5
f() = g + 1
println(f())
