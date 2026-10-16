buf = StaticArray(Int32, 4).new(0)
buf[0] = 10
buf[3] = 40
puts buf
puts buf.size
puts buf.sum

slice = Slice[5, 3, 8, 1]
puts slice.sort
puts slice[1, 2]
puts slice.to_a.inspect

bytes = Bytes.new(4) { |i| (i * 16).to_u8 }
puts bytes.hexstring
puts bytes.reverse!

dest = Slice(Int32).new(4, 0)
dest.copy_from(slice)
puts dest
