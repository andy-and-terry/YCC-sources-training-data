def varint(n : Int32) : Array(UInt8)
  out = [] of UInt8
  while n >= 0x80
    out << ((n & 0x7F) | 0x80).to_u8
    n >>= 7
  end
  out << n.to_u8
  out
end

puts varint(300).map(&.to_s(16)).join(" ")
