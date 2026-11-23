# n(2n^2+1)/3
term(n::Int) = div((n * (((2 * n) * n) + 1)), 3)

for n in 1:15
    println(n, " -> ", term(n))
end
