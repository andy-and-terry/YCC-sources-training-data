function reversebits(v::UInt8)
    r = UInt8(0)
    for _ in 1:8
        r = (r << 1) | (v & 0x01)
        v >>= 1
    end
    return r
end

for v in UInt8[1, 6, 13, 128]
    println(v, " ", reversebits(v)) # 128 96 176 1
end
