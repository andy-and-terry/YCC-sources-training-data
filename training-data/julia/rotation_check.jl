is_rotation(a::AbstractString, b::AbstractString) = length(a) == length(b) && occursin(b, a * a)

println(is_rotation("waterbottle", "erbottlewat"))
println(is_rotation("abc", "acb"))
