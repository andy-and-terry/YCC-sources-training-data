arr = [1, 2, 3, 4, 5]

println(arr .^ 2)
println(arr .+ 10)
println(sqrt.(arr))
println(arr[arr .% 2 .== 0])
