isautomorphic(n::Int) = endswith(string(n^2), string(n))

println(filter(isautomorphic, 0:999)) # [0, 1, 5, 6, 25, 76, 376, 625]
