A = reshape(1:12, 3, 4)
println(A)
println(A[2, :])
println(A[:, end])
println(A[2:3, [1, 4]])

B = collect(A)
v = @view B[1, :]
v[1] = 100
println(B[1, 1])

c = copy(B[:, 1])
c[1] = -1
println(B[1, 1], " ", c)

println(sum(A, dims=1), " ", sum(A, dims=2))
println(findall(x -> x > 9, A))
println(size(A), " ", ndims(A), " ", length(A))
println(vec(A)[1:5], " ", A')
