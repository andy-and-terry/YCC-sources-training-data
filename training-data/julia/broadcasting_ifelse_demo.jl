arr = [-3, 4, -1, 0, 7, -8]

println(ifelse.(arr .>= 0, arr, -arr))

labels = ifelse.(iseven.(arr), "even", "odd")
println(labels)

matrix = [1 -2; -3 4]
println(abs.(matrix))
