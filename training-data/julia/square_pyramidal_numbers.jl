# n(n+1)(2n+1)/6
term(n::Int) = div(((n * (n + 1)) * ((2 * n) + 1)), 6)

for n in 1:15
    println(n, " -> ", term(n))
end
