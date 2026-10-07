function is_isogram(word::AbstractString)
    letters = filter(isletter, lowercase(word))
    return allunique(letters)
end

for w in ("lumberjacks", "background", "six-year-old", "isograms")
    println(w, " ", is_isogram(w))
end
