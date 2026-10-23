let word = 'vimscript'

let chars = split(word, '\zs')
echo chars
echo join(reverse(copy(chars)), '')
echo len(chars)

let counts = {}
for ch in chars
  let counts[ch] = get(counts, ch, 0) + 1
endfor
echo sort(items(counts))

echo split('a1b22c333', '\d\+\zs')
echo split('  padded   words ')
echo split('a,,b', ',', 1)
