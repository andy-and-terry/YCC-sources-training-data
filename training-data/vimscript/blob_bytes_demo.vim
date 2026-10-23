" Blobs hold raw bytes
let b = 0z48656C6C6F
echo 'length: ' . len(b)
echo 'first byte: ' . b[0]
echo 'as string: ' . list2str(blob2list(b))

" Build a blob byte by byte
let out = 0z
for n in [72, 105, 33]
  call add(out, n)
endfor
echo 'built: ' . string(out)
echo 'text: ' . list2str(blob2list(out))

" Slice and compare
echo 'slice: ' . string(b[1:3])
echo 'equal: ' . (b == 0z48656C6C6F)

" Convert between lists and blobs
let nums = [1, 2, 255]
let bl = list2blob(nums)
echo 'hex: ' . string(bl)
echo 'back: ' . string(blob2list(bl))

" Modify in place
let b[0] = 0x4A
echo 'modified: ' . list2str(blob2list(b))
