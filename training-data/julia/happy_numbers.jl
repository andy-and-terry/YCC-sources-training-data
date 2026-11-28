function ishappy(n::Int)
    seen = Set{Int}()
    while n != 1 && !(n in seen)
        push!(seen, n)
        n = sum(d^2 for d in digits(n))
    end
    return n == 1
end

println(filter(ishappy, 1:40)) # [1, 7, 10, 13, 19, 23, 28, 31, 32, 44]
