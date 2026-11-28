function encode(text::String, rails::Int)
    rows = [Char[] for _ in 1:rails]
    r, step = 1, 1
    for ch in text
        push!(rows[r], ch)
        r == 1 && (step = 1)
        r == rails && (step = -1)
        r += step
    end
    return join(join.(rows))
end

println(encode("WEAREDISCOVERED", 3))
