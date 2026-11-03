function count_vowels(s)
    counts = Dict(v => 0 for v in "aeiou")
    for c in lowercase(s)
        haskey(counts, c) && (counts[c] += 1)
    end
    counts
end

for (k, v) in sort(collect(count_vowels("Education is beautiful")))
    print(k, "=", v, " ")
end
println()
