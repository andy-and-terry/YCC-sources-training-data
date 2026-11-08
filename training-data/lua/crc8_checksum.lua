local function crc8(s)
  local crc = 0
  for i = 1, #s do
    crc = crc ~ s:byte(i)
    for _ = 1, 8 do
      if crc & 0x80 ~= 0 then crc = ((crc << 1) ~ 0x07) & 0xFF else crc = (crc << 1) & 0xFF end
    end
  end
  return crc
end

print(string.format("%02x", crc8("123456789")))
