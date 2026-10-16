function zigzag(s::String, rows::Int)
    (rows == 1 || rows >= length(s)) && return s
    lines = [IOBuffer() for _ in 1:rows]
    row, dir = 1, 1
    for c in s
        print(lines[row], c)
        if row == 1
            dir = 1
        elseif row == rows
            dir = -1
        end
        row += dir
    end
    return join(String(take!(l)) for l in lines)
end

println(zigzag("PAYPALISHIRING", 3))
println(zigzag("PAYPALISHIRING", 4))
println(zigzag("AB", 1))
