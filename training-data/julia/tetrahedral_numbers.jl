# n(n+1)(n+2)/6
term(n::Int) = div(((n * (n + 1)) * (n + 2)), 6)

for n in 1:15
    println(n, " -> ", term(n))
end
