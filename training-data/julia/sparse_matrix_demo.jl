using SparseArrays, LinearAlgebra

A = sparse([1, 2, 3, 3], [1, 2, 1, 3], [4.0, 5.0, 1.0, 6.0], 3, 3)
println(A)
println(nnz(A))
println(Matrix(A))
println(findnz(A))

x = [1.0, 2.0, 3.0]
println(A * x)
println(A \ x)

I3 = sparse(1.0I, 3, 3)
println(nnz(I3))
println(nnz(A + I3))
println(A')
println(sum(A, dims = 1))
S = spzeros(4, 4)
S[2, 3] = 7.0
println(nnz(S), " ", S[2, 3])
