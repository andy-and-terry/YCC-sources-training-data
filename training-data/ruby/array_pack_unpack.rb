bytes = [72, 105, 33].pack("C*")
puts bytes

puts [1, 2].pack("s>l<").unpack("C*").inspect
puts ["abc"].pack("m0")            # base64
puts "YWJj".unpack1("m")
puts ["616263"].pack("H*")
puts "abc".unpack1("H*")
p "abc".unpack("C*")
p [65, 66].pack("U*")
p "é".bytes
