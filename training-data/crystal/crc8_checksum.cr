def crc8(data : Bytes) : UInt8
  crc = 0_u8
  data.each do |b|
    crc ^= b
    8.times do
      crc = (crc & 0x80) != 0 ? (crc << 1) ^ 0x07_u8 : crc << 1
    end
  end
  crc
end

puts crc8("123456789".to_slice).to_s(16)
