mutable struct LFUCache
    capacity::Int
    values::Dict{Int, Int}
    freqs::Dict{Int, Int}
    LFUCache(cap::Int) = new(cap, Dict{Int, Int}(), Dict{Int, Int}())
end

function get_value(cache::LFUCache, key::Int)
    if haskey(cache.values, key)
        cache.freqs[key] += 1
        return cache.values[key]
    end
    return nothing
end

function put!(cache::LFUCache, key::Int, value::Int)
    if cache.capacity == 0
        return
    end
    if haskey(cache.values, key)
        cache.values[key] = value
        cache.freqs[key] += 1
        return
    end
    if length(cache.values) >= cache.capacity
        least_key = first(sort(collect(keys(cache.freqs)), by = k -> cache.freqs[k]))
        delete!(cache.values, least_key)
        delete!(cache.freqs, least_key)
    end
    cache.values[key] = value
    cache.freqs[key] = 1
end

cache = LFUCache(2)
put!(cache, 1, 1)
put!(cache, 2, 2)
println(get_value(cache, 1))
put!(cache, 3, 3)  # evicts key 2 (least frequently used)
println(get_value(cache, 2))
println(get_value(cache, 3))
