# n(n+1)(n+2)(n+3)/24
term(n::Int) = div((((n * (n + 1)) * (n + 2)) * (n + 3)), 24)

for n in 1:15
    println(n, " -> ", term(n))
end
