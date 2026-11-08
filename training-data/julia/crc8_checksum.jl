function crc8(data::Vector{UInt8})
    crc = 0x00
    for b in data
        crc ⊻= b
        for _ in 1:8
            crc = (crc & 0x80) != 0 ? (crc << 1) ⊻ 0x07 : crc << 1
        end
    end
    crc
end

println(string(crc8(Vector{UInt8}("123456789")), base = 16))
