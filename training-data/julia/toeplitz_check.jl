is_toeplitz(m::AbstractMatrix) =
    all(m[i, j] == m[i-1, j-1] for i in 2:size(m, 1), j in 2:size(m, 2))

println(is_toeplitz([1 2 3; 4 1 2; 5 4 1]))
println(is_toeplitz([1 2; 2 2]))
