is_pangram(s::AbstractString) = issubset('a':'z', Set(lowercase(s)))

println(is_pangram("The quick brown fox jumps over the lazy dog"))
println(is_pangram("Hello world"))
