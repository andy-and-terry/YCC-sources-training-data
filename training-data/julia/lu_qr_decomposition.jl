using LinearAlgebra

A = [4.0 3.0; 6.0 3.0]
b = [10.0, 12.0]

F = lu(A)
println(F.L)
println(F.U)
println(F.p)
println(F \ b)
println(F.L * F.U ≈ A[F.p, :])

Q, R = qr([1.0 2.0; 3.0 4.0; 5.0 6.0])
println(round.(Matrix(R); digits = 4))
println(size(Matrix(Q)))

S = [2.0 1.0; 1.0 2.0]
println(isposdef(S))
C = cholesky(S)
println(round.(C.L; digits = 4))
println(C.L * C.L' ≈ S)

println(round(det(A); digits = 6), " ", rank(A), " ", round(cond(A); digits = 3))
println(norm([3.0, 4.0]), " ", opnorm(A, 1))
