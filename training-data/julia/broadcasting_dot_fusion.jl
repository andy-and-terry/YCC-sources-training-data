x = [1.0, 2.0, 3.0]
y = x .^ 2 .+ 3 .* x .- 1
println(y)
println(sin.(x) .^ 2 .+ cos.(x) .^ 2)
println(@. x^2 + 2x + 1)
A = [1 2; 3 4]
println(A .+ [10, 20], " ", A .* [1 2], " ", A .== [1 0; 3 0])
println(max.(x, 2), " ", min.(x, 2), " ", clamp.(x, 1.5, 2.5))
println(string.("id", 1:3), " ", uppercase.(["a", "b"]), " ", length.(["a", "bb"]))
f(a, b) = a * 10 + b
println(f.(1:3, 4:6), " ", f.([1, 2], 5))
z = zeros(3)
z .= x .* 2
println(z)
println(sum(abs2, x), " ", count(>(1), x), " ", any(isinteger, x))
println(Ref(5) .+ [1, 2], " ", [1, 2, 3] .|> sqrt .|> round)
println(identity.((1, 2)), " ", (a -> a + 1).(1:3), " ", in.(2, [[1, 2], [3]]))
