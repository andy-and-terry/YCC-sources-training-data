function varint(n::Integer)
    out = UInt8[]
    while n >= 0x80
        push!(out, UInt8((n & 0x7F) | 0x80))
        n >>= 7
    end
    push!(out, UInt8(n))
    out
end

println(bytes2hex(varint(300)))
