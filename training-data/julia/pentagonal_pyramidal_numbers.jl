# n^2(n+1)/2
term(n::Int) = div(((n * n) * (n + 1)), 2)

for n in 1:15
    println(n, " -> ", term(n))
end
