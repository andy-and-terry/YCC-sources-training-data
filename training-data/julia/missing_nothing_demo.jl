data = [1, missing, 3, missing, 5]

println(sum(skipmissing(data)))
println(collect(skipmissing(data)))
println(ismissing.(data))
println(coalesce.(data, 0))
println(1 + missing, " ", missing == missing, " ", isequal(missing, missing))
println(count(!ismissing, data))

function find_index(xs, target)
    for (i, x) in enumerate(xs)
        x == target && return i
    end
    return nothing
end

idx = find_index([10, 20, 30], 20)
println(idx, " ", find_index([10, 20], 99))
println(something(nothing, 42), " ", isnothing(idx))

d = Dict("a" => 1)
println(get(d, "b", missing), " ", get(d, "a", missing))
println(typeof(missing), " ", typeof(nothing), " ", Union{Missing,Int})
