# Narayana's cows N(n)=N(n-1)+N(n-3)
v = [1, 1, 1]
for i in 4:10
    push!(v, v[i - 1] + v[i - 3])
end
println(join(v, " "))
