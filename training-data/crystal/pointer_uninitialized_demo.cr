ptr = Pointer(Int32).malloc(4)
4.times { |i| ptr[i] = (i + 1) * 11 }
puts ptr[2]
puts (ptr + 1).value
puts ptr.to_slice(4).sum

ptr.realloc(8)
x = 5
px = pointerof(x)
px.value = 99
puts x

buf = uninitialized Int32[3]
buf[0] = 1
buf[1] = 2
buf[2] = 3
puts buf.sum
puts sizeof(Int32), sizeof(Int64), sizeof(Char)
