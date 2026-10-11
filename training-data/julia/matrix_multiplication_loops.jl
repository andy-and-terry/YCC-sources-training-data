function matmul(A::Matrix, B::Matrix)
    n, k = size(A)
    k2, m = size(B)
    k == k2 || throw(DimensionMismatch("inner dimensions differ"))
    C = zeros(promote_type(eltype(A), eltype(B)), n, m)
    for j in 1:m, p in 1:k, i in 1:n
        C[i, j] += A[i, p] * B[p, j]
    end
    return C
end

A = [1 2; 3 4; 5 6]
B = [7 8 9; 10 11 12]

println(matmul(A, B))
println(matmul(A, B) == A * B)
println(size(A'), " ", A' * A)
