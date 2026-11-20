# Manhattan distance, with a method for generic vectors.
manhattan(a::AbstractVector, b::AbstractVector) = sum(abs.(a .- b))
println(manhattan([1, 2], [4, 6]))
