mutable struct LRUCache
    capacity::Int
    map::Dict{Int, Int}
    order::Vector{Int}
    LRUCache(cap::Int) = new(cap, Dict{Int, Int}(), Int[])
end

function get_value(cache::LRUCache, key::Int)
    if haskey(cache.map, key)
        filter!(k -> k != key, cache.order)
        push!(cache.order, key)
        return cache.map[key]
    end
    return nothing
end

function put!(cache::LRUCache, key::Int, value::Int)
    if haskey(cache.map, key)
        filter!(k -> k != key, cache.order)
    end
    cache.map[key] = value
    push!(cache.order, key)
    if length(cache.order) > cache.capacity
        evict = popfirst!(cache.order)
        delete!(cache.map, evict)
    end
end

cache = LRUCache(2)
put!(cache, 1, 1)
put!(cache, 2, 2)
println(get_value(cache, 1))
put!(cache, 3, 3)
println(get_value(cache, 2))
