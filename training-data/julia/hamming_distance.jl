function hamming(a::AbstractString, b::AbstractString)
    length(a) == length(b) || throw(ArgumentError("strands must be of equal length"))
    return count(((x, y),) -> x != y, zip(a, b))
end

println(hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"))
try
    hamming("AB", "A")
catch e
    println("error: ", e.msg)
end
