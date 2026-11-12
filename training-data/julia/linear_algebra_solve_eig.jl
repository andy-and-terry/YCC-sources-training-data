using LinearAlgebra
A = [2.0 1.0; 1.0 3.0]
b = [1.0, 2.0]
println(A \ b)
println(eigvals(A))
println(det(A), " ", tr(A))
