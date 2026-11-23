# n(n+1)/2+1
term(n::Int) = div((n * (n + 1)), 2) + 1

for n in 1:15
    println(n, " -> ", term(n))
end
