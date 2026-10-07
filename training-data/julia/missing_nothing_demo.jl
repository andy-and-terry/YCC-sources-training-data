# `nothing` means "no value"; `missing` is a statistical missing datum that
# propagates through operations.
println(missing + 1)
println(missing == missing)
println(ismissing(missing), " ", isnothing(nothing))
println(coalesce(missing, 5))
println(coalesce(nothing, missing, 3))

data = [1, missing, 3, missing, 5]
println(sum(skipmissing(data)))
println(collect(skipmissing(data)))
println(count(ismissing, data))
println(sum(skipmissing(data)) / count(!ismissing, data))

println(true || missing)
println(false && missing)
println(typeof(data))
println(something(nothing, 7))

function find_even(xs)
    for x in xs
        iseven(x) && return x
    end
    return nothing
end
println(find_even([1, 3, 4]))
println(find_even([1, 3]))
println(passmissing(sqrt)(missing))
