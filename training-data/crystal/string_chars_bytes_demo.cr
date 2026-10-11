s = "héllo"

puts s.size
puts s.bytesize
puts s.chars.inspect
puts s.bytes.inspect
puts s.reverse
puts s.codepoints.inspect
puts s[1]
puts s[1..3]
puts s.byte_slice(0, 3)
puts s.valid_encoding?
puts s.each_char.with_index.map { |c, i| i.even? ? c.upcase : c }.join
puts String.new(Slice[104_u8, 105_u8])
