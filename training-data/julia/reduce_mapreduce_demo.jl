xs = [3, 1, 4, 1, 5, 9, 2, 6]

println(reduce(+, xs), " ", reduce(max, xs))
println(mapreduce(x -> x^2, +, xs))
println(foldl(-, xs), " ", foldr(-, xs))
println(accumulate(+, xs))
println(cumprod(1:6))
println(sum(abs2, xs), " ", prod(xs))
println(any(>(8), xs), " ", all(>(0), xs))
println(count(iseven, xs), " ", findall(==(1), xs), " ", findfirst(==(5), xs))
println(extrema(xs), " ", argmax(xs), " ", argmin(xs))
println(filter(isodd, xs), " ", unique(xs), " ", sort(xs; rev = true))
println(reduce(vcat, [[1, 2], [3], [4, 5]]))
println(mapreduce(length, +, ["ab", "cde", "f"]))
