using LinearAlgebra
A = [2.0 1.0; 1.0 3.0]
b = [3.0, 5.0]
x = A \ b
println(x)
println(det(A), " ", A * x ≈ b)
