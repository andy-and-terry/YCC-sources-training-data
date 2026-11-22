# Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
r = 0
out = Int[]
for _ in 1:8
    global r = r * 10 + 1
    push!(out, r)
end
println(join(out, " "))
