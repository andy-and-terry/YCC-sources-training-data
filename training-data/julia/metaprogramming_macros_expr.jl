ex = :(1 + 2 * 3)
println(ex, " ", eval(ex), " ", typeof(ex), " ", ex.head, " ", ex.args)
x = 10
println(:($x + 1), " ", eval(:($x + 1)))
macro twice(e) quote $(esc(e)); $(esc(e)) end end
@twice println("hi")
macro unless(c, body) :(if !$(esc(c)) $(esc(body)) end) end
@unless false println("ran")
macro showval(e) :(println($(string(e)), " = ", $(esc(e)))) end
@showval 2 + 3
f = Meta.parse("a * b")
println(f, " ", dump(f) === nothing)
@eval foo(x) = x * 100
println(foo(3))
for name in [:alpha, :beta]
    @eval $(Symbol("get_", name))() = $(string(name))
end
println(get_alpha(), get_beta())
println(@macroexpand @twice 1)
println(Expr(:call, :+, 1, 2) |> eval)
println(typeof(:sym), " ", QuoteNode(:q))
