function fletcher16(data::Vector{UInt8})
    s1 = s2 = 0
    for b in data
        s1 = (s1 + b) % 255
        s2 = (s2 + s1) % 255
    end
    return (s2 << 8) | s1
end

println(string(fletcher16(Vector{UInt8}("abcde")), base = 16))
