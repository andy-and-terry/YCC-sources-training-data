require "zlib"

text = "abc" * 1000
packed = Zlib::Deflate.deflate(text)
restored = Zlib::Inflate.inflate(packed)

puts text.bytesize
puts packed.bytesize < text.bytesize
puts restored == text
puts Zlib.crc32("hello")
