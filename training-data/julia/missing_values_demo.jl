data = [1, 2, missing, 4, missing, 6]

println(typeof(data))
println(sum(skipmissing(data)))
println(collect(skipmissing(data)))
println(count(ismissing, data))

println(missing + 1)
println(missing == missing)
println(isequal(missing, missing))
println(missing & false, " ", missing | true)

println(coalesce(missing, 0))
println(coalesce.(data, 0))

mean_ignoring(xs) = (v = collect(skipmissing(xs)); isempty(v) ? missing : sum(v) / length(v))
println(mean_ignoring(data))
println(mean_ignoring([missing, missing]))

println(map(x -> ismissing(x) ? "NA" : string(x), data))
println(replace(data, missing => -1))

x = nothing
println(something(x, "fallback"))
println(isnothing(x), " ", ismissing(x))
println(findfirst(ismissing, data))
println(passmissing(sqrt)(missing), " ", passmissing(sqrt)(16))
