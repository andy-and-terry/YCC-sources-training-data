# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
row = [1]
out = [1]
for _ in 1:9
    global row = cumsum(vcat(0, reverse(row)))
    push!(out, row[end])
end
println(join(out, " "))
