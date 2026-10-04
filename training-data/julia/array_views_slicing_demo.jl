A = reshape(1:12, 3, 4)
println(A)

println(A[2, :])
println(A[:, 3])
println(A[2:3, [1, 4]])
println(A[end, end], " ", A[end])

B = collect(A)
v = view(B, 1, :)
v[1] = 100
println(B[1, 1])

c = B[2, :]
c[1] = -1
println(B[2, 1])

@views begin
    col = B[:, 2]
    col .*= 10
end
println(B)

println(size(B), " ", ndims(B), " ", length(B))
println(B[B .> 50])
println(findall(x -> x > 50, B))
println(sum(B, dims = 1))
println(sum(B, dims = 2))
println(eachrow(B) |> first)
println(map(sum, eachcol(B)))
println(permutedims(B)[:, 1])
println(hcat([1, 2], [3, 4]), " ", vcat([1 2], [3 4]))
println(dropdims(sum(B, dims = 1), dims = 1))
println(copy(B) == B, " ", B === B)
