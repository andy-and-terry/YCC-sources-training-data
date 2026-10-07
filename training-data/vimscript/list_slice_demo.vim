let items = ['a', 'b', 'c', 'd', 'e', 'f']

echo items[0]
echo items[-1]
echo items[1:3]
echo items[:2]
echo items[-2:]
echo items[2:]

" Slicing past the end is safe
echo items[4:100]

" Reverse and rotate
echo reverse(copy(items))
echo items[2:] + items[:1]
