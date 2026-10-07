function sign_name(x)
    x < 0 ? "negative" : x == 0 ? "zero" : "positive"
end
println(map(sign_name, [-2, 0, 5]))

check(x) = x > 0 && println("positive: ", x)
check(3); check(-1)

safe_get(d, k) = haskey(d, k) || return "missing"
println(safe_get(Dict(:a => 1), :b))

x = nothing
println(something(x, 42))
println(isnothing(x), " ", coalesce(x, "default"))

for i in 1:10
    i % 2 == 0 && continue
    i > 7 && break
    print(i, " ")
end
println()
r = if 5 > 3 "yes" else "no" end
println(r)
