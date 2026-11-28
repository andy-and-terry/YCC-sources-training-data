let s = 'abcabc'
let k = 3
for i in range(0, len(s) - k)
  let h = 0
  for c in split(s[i : i + k - 1], '\zs')
    let h = (h * 31 + char2nr(c)) % 1000003
  endfor
  echo i h
endfor
