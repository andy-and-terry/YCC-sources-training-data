const LIMIT = 100
counter = 0

function bump!()
    global counter += 1
end

for _ in 1:3
    bump!()
end
println(counter)

function use_const(n)
    return n > LIMIT ? "big" : "small"
end
println(use_const(5), " ", use_const(500))

for i in 1:3
    local_total = i * 2
    println(local_total)
end
println(@isdefined(local_total))

let a = 1
    a += 1
    println(a)
end
println(@isdefined(a))
