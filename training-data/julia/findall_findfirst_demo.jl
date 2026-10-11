v = [3, 8, 1, 8, 5, 8]

println(findfirst(==(8), v))
println(findlast(==(8), v))
println(findall(==(8), v))
println(findall(x -> x > 4, v))
println(findnext(==(8), v, 3))
println(findfirst(==(99), v))

s = "banana"
println(findfirst('n', s))
println(findall("an", s))
println(findfirst("nan", s))

println(argmax(v), " ", argmin(v))
println(indexin([8, 5], v))
