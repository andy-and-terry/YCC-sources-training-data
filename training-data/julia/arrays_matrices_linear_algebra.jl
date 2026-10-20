using LinearAlgebra
A = [1 2; 3 4]
B = [0 1; 1 0]
println(A * B, " ", A .* B)
println(det(A), " ", tr(A), " ", transpose(A), " ", inv(A))
println(A \ [5, 6])
println(size(zeros(2, 3)), " ", ones(Int, 2), " ", Matrix{Int}(I, 2, 2))
println(reshape(1:6, 2, 3))
println(vcat([1 2], [3 4]), " ", hcat([1, 2], [3, 4]))
println(A[:, 1], " ", A[2, :], " ", A[end, end], " ", view(A, 1:2, 2))
println(dot([1, 2, 3], [4, 5, 6]), " ", norm([3, 4]), " ", cross([1, 0, 0], [0, 1, 0]))
println(sort([3, 1, 2], rev=true), " ", cumsum(1:5), " ", diff([1, 4, 9, 16]))
println(maximum(A), " ", argmax([1, 9, 3]), " ", sum(A, dims=1), " ", mapslices(sum, A, dims=2))
println(eigvals(Symmetric([2.0 0.0; 0.0 3.0])))
