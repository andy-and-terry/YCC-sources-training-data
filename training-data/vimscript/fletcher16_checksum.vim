function! Fletcher16(s) abort
  let s1 = 0
  let s2 = 0
  for i in range(strlen(a:s))
    let s1 = (s1 + char2nr(a:s[i])) % 255
    let s2 = (s2 + s1) % 255
  endfor
  return or(s2 * 256, s1)
endfunction

echo printf('%x', Fletcher16('abcde'))
