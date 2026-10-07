x = [1.0, 4.0, 9.0]
println(sqrt.(x))
println(x .+ 1)
println(x .* x)
println(x .^ 2)
println(sin.(x) .^ 2 .+ cos.(x) .^ 2 .≈ 1)

# @. fuses every operation in an expression
y = @. 3x^2 + 2x + 1
println(y)

# in-place broadcasting
z = zeros(3)
z .= x .* 2
println(z)

# outer-product style broadcasting
col = [1, 2, 3]
row = [10 20]
println(col .* row)
println(col .+ row)

# broadcasting works with any function
words = ["a", "bb", "ccc"]
println(length.(words))
println(uppercase.(words))
println(string.(words, "!"))
println(max.([1, 5, 3], [4, 2, 6]))

# scalars and Refs stay whole
println(in.(2, [[1, 2], [3]]))
println(map(w -> w in ("a", "ccc"), words))
println(count(isodd, [1, 2, 3]), sum(abs2, [3, 4]))
println(Ref([1, 2]) .== [[1, 2], [3]])
