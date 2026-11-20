# Lattice paths with a DP row.
function lattice(n)
    row = ones(Int, n + 1)
    for _ in 1:n, j in 2:n+1
        row[j] += row[j-1]
    end
    row[end]
end
println(lattice(3))
