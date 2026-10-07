# views share memory with the parent array; slices copy.
A = collect(1:10)
slice = A[2:4]
v = @view A[2:4]

slice[1] = 100
println(A[2])
v[1] = 200
println(A[2])

M = reshape(1:12, 3, 4) |> collect
col = view(M, :, 2)
col .= 0
println(M)

@views row_sum = sum(M[1, :])
println(row_sum)
println(parent(col) === M)
println(typeof(v))

r = reshape(A, 2, 5)
r[1, 1] = -1
println(A[1])

function sum_halves(x)
    h = length(x) ÷ 2
    return sum(@view x[1:h]), sum(@view x[h+1:end])
end
println(sum_halves(collect(1:10)))
