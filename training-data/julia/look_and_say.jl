function next_term(s::AbstractString)
    io = IOBuffer()
    chars = collect(s)
    i = 1
    while i <= length(chars)
        j = i
        while j <= length(chars) && chars[j] == chars[i]
            j += 1
        end
        print(io, j - i, chars[i])
        i = j
    end
    return String(take!(io))
end

let s = "1"
    for _ in 1:8
        println(s)
        s = next_term(s)
    end
end
