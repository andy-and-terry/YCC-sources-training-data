function collatz(n::Int)
    steps = [n]
    while n != 1
        n = iseven(n) ? n ÷ 2 : 3n + 1
        push!(steps, n)
    end
    return steps
end

println(collatz(6))
println(length(collatz(27)) - 1)

best = argmax(n -> length(collatz(n)), 1:1000)
println(best, " takes ", length(collatz(best)) - 1, " steps")
println(maximum(collatz(27)))
