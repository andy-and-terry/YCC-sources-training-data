def varint(n)
  out = []
  while n >= 0x80
    out << ((n & 0x7F) | 0x80)
    n >>= 7
  end
  out << n
end

puts varint(300).map { |b| format("%02x", b) }.join(" ")
