function fibonacci(n::Int, cache::Dict{Int,Int}=Dict{Int,Int}())
    if n < 2
        return n
    end
    if haskey(cache, n)
        return cache[n]
    end
    result = fibonacci(n - 1, cache) + fibonacci(n - 2, cache)
    cache[n] = result
    return result
end

println([fibonacci(n) for n in 0:9])
