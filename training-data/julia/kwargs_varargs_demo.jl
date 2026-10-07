function describe(name, args...; sep = ", ", upper = false, kwargs...)
    parts = string.(args)
    line = name * ": " * join(parts, sep)
    extras = join(["$k=$v" for (k, v) in kwargs], " ")
    line = upper ? uppercase(line) : line
    return isempty(extras) ? line : line * " [" * extras * "]"
end

println(describe("nums", 1, 2, 3))
println(describe("nums", 1, 2, 3; sep = "-", upper = true))
println(describe("x"; debug = true, level = 2))

values = (10, 20, 30)
println(describe("splat", values...))
opts = (sep = "|", upper = false)
println(describe("opts", 1, 2; opts...))

function area(; width, height = width)
    return width * height
end
println(area(width = 3), " ", area(width = 3, height = 4))

compose(f, g) = (args...; kw...) -> f(g(args...; kw...))
println(compose(sqrt, abs)(-16))
