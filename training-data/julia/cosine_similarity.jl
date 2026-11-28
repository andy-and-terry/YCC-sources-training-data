using LinearAlgebra

cosine(a, b) = dot(a, b) / (norm(a) * norm(b))

println(round(cosine([1, 2, 3], [4, 5, 6]); digits = 4))
