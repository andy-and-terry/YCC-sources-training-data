# Perrin sequence P(n)=P(n-2)+P(n-3)
v = [3, 0, 2]
for i in 4:10
    push!(v, v[i - 2] + v[i - 3])
end
println(join(v, " "))
