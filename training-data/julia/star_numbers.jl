# 6n(n-1)+1
term(n::Int) = ((6 * n) * (n - 1)) + 1

for n in 1:15
    println(n, " -> ", term(n))
end
