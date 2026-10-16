function group_anagrams(words)
    groups = Dict{String,Vector{String}}()
    for w in words
        key = String(sort(collect(w)))
        push!(get!(groups, key, String[]), w)
    end
    return sort(collect(values(groups)); by = g -> (-length(g), g[1]))
end

words = ["eat", "tea", "tan", "ate", "nat", "bat"]
for g in group_anagrams(words)
    println(g)
end
