type
  Buffer = object
    name: string
    data: ptr UncheckedArray[int]
    len: int

proc `=destroy`(b: Buffer) =
  if b.data != nil:
    echo "destroy ", b.name
    dealloc(b.data)

proc `=copy`(dest: var Buffer, src: Buffer) =
  if dest.data == src.data: return
  `=destroy`(dest)
  dest.name = src.name & "-copy"
  dest.len = src.len
  dest.data = cast[ptr UncheckedArray[int]](alloc(src.len * sizeof(int)))
  for i in 0 ..< src.len:
    dest.data[i] = src.data[i]
  echo "copy ", src.name, " -> ", dest.name

proc newBuffer(name: string, n: int): Buffer =
  result.name = name
  result.len = n
  result.data = cast[ptr UncheckedArray[int]](alloc0(n * sizeof(int)))

proc consume(b: sink Buffer) =
  echo "consuming ", b.name, " (", b.len, " ints)"

when isMainModule:
  var a = newBuffer("a", 4)
  a.data[2] = 42
  var b = a            # triggers =copy
  b.data[2] = 7
  echo a.data[2], " ", b.data[2]
  consume(move a)      # ownership moves, no copy
  echo "end of main"
