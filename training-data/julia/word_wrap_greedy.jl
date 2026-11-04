function wrap(text, width)
    lines = String[]
    line = ""
    for word in split(text)
        if !isempty(line) && length(line) + 1 + length(word) > width
            push!(lines, line)
            line = String(word)
        else
            line = isempty(line) ? String(word) : line * " " * word
        end
    end
    isempty(line) || push!(lines, line)
    lines
end

for l in wrap("the quick brown fox jumps over the lazy dog", 15)
    println("|", rpad(l, 15), "|")
end
