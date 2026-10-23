" Converting strings to character codes and back
let word = 'Vim'
let codes = str2list(word)
echo word . ' -> ' . string(codes)
echo 'back: ' . list2str(codes)

" Caesar shift using code points
let shifted = list2str(map(str2list('hello'), 'v:val + 1'))
echo 'shifted: ' . shifted

" Upper-casing via arithmetic on codes
let upper = list2str(map(str2list('abc xyz'),
  \ {_, c -> c >= 97 && c <= 122 ? c - 32 : c}))
echo 'upper: ' . upper

" Multibyte characters give one code per character
let uni = 'aé€'
echo 'codes: ' . string(str2list(uni))
echo 'bytes: ' . strlen(uni) . ', chars: ' . strchars(uni)

" nr2char and char2nr are the single-character versions
echo nr2char(65) . nr2char(0x20AC)
echo char2nr('€')

" Frequency of each character code
let freq = {}
for c in str2list('mississippi')
  let k = nr2char(c)
  let freq[k] = get(freq, k, 0) + 1
endfor
for k in sort(keys(freq))
  echo k . ': ' . freq[k]
endfor
