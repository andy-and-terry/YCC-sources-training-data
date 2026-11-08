function crc = crc8_checksum(bytes)
    crc = uint8(0);
    for b = uint8(bytes)
        crc = bitxor(crc, b);
        for k = 1:8
            if bitand(crc, uint8(128))
                crc = bitxor(bitshift(crc, 1), uint8(7));
            else
                crc = bitshift(crc, 1);
            end
        end
    end
end
