A = reshape(1:12, 3, 4)
println(A)
println(A[2, :])
println(A[:, 3])
println(A[1:2, 2:3])
println(A[end, end])
println(A[[1, 3], [1, 4]])
println(A[A .> 8])

v = collect(10:10:100)
println(v[2:3:end])
println(v[end:-3:1])

# views share memory with the parent
w = @view v[2:4]
w[1] = -1
println(v[2])
println(typeof(w))

# slices copy
c = v[2:4]
c[1] = 999
println(v[2])

B = copy(A)
B[:, 2] .= 0
println(B)
println(size(A'), size(vec(A)))
println(eachcol(A) |> collect |> length)
println(sum(A, dims=1), sum(A, dims=2))
println(findall(x -> x % 5 == 0, v))
println(firstindex(v), lastindex(v))
