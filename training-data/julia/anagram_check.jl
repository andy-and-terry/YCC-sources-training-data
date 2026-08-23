function normalize(s::String)
    return sort(collect(filter(c -> c != ' ', lowercase(s))))
end

function is_anagram(a::String, b::String)
    return normalize(a) == normalize(b)
end

println(is_anagram("listen", "silent"))
println(is_anagram("hello", "world"))
