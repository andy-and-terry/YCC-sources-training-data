let csv = ',red,green,,blue,'

" Leading and trailing empty items are dropped by default; pass 1 to keep all
echo split(csv, ',')
echo split(csv, ',', 1)

" Split into characters and rejoin
let chars = split('hello', '\zs')
echo chars
echo join(reverse(chars), '')

" Whitespace splitting
echo split('  many   spaces here ')

echo join(['a', 'b', 'c'], '-')
echo repeat('ab', 3)
