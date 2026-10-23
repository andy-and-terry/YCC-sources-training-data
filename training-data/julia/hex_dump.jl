function hex_dump(data::Vector{UInt8}; width = 16)
    for off in 1:width:length(data)
        chunk = data[off:min(off + width - 1, end)]
        hex = join(string.(chunk, base = 16, pad = 2), " ")
        text = String([b in 32:126 ? Char(b) : '.' for b in chunk])
        println(string(off - 1, base = 16, pad = 8), "  ", rpad(hex, width * 3 - 1), "  ", text)
    end
end

hex_dump(vcat(codeunits("Hello, Julia!\n\tBinary: "), UInt8[0, 1, 255]))
