function zigzag(s::String, rows::Int)
    (rows == 1 || rows >= length(s)) && return s
    lines = [IOBuffer() for _ in 1:rows]
    r, step = 1, 1
    for c in s
        write(lines[r], c)
        r == 1 && (step = 1)
        r == rows && (step = -1)
        r += step
    end
    join(String(take!(l)) for l in lines)
end

println(zigzag("PAYPALISHIRING", 3))
