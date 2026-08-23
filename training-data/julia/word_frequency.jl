function word_frequency(text::String)
    freq = Dict{String, Int}()
    for word in split(lowercase(text))
        freq[word] = get(freq, word, 0) + 1
    end
    return freq
end

println(word_frequency("the quick brown fox the lazy fox"))
