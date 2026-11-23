# 3n(n-1)+1
term(n::Int) = ((3 * n) * (n - 1)) + 1

for n in 1:15
    println(n, " -> ", term(n))
end
