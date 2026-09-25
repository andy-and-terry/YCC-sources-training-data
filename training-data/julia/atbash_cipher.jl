flipchar(c::Char) = 'a' <= c <= 'z' ? Char('z' - (c - 'a')) : c

decode(text) = join(flipchar(c) for c in lowercase(text) if isletter(c) || isdigit(c))

function encode(text)
    d = decode(text)
    return join((d[i:min(i + 4, end)] for i in 1:5:length(d)), " ")
end

e = encode("The quick brown fox")
println(e, " -> ", decode(e))
