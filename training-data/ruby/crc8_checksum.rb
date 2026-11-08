def crc8(bytes)
  bytes.reduce(0) do |crc, b|
    crc ^= b
    8.times { crc = crc & 0x80 != 0 ? ((crc << 1) ^ 0x07) & 0xFF : (crc << 1) & 0xFF }
    crc
  end
end

puts format("%02x", crc8("123456789".bytes))
