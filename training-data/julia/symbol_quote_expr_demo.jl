ex = :(1 + 2 * 3)
println(ex)
println(typeof(ex))
println(ex.head, " ", ex.args)
println(eval(ex))

x = 10
ex2 = :(x + $x)
println(ex2)

sym = :velocity
println(sym, " ", typeof(sym), " ", String(sym))
println(Symbol("a", 1, "b"))

q = quote
    y = 5
    y * 2
end
println(eval(q))

add_expr = Expr(:call, :+, 1, 2, 3)
println(add_expr, " = ", eval(add_expr))
