function zeckendorf(n)
    fibs = [1, 2]
    while fibs[end] + fibs[end-1] <= n
        push!(fibs, fibs[end] + fibs[end-1])
    end
    parts = Int[]
    for f in reverse(fibs)
        if f <= n
            push!(parts, f)
            n -= f
        end
    end
    return parts
end

println(join(zeckendorf(100), " "))
