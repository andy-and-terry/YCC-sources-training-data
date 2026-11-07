function! AddBinary(a, b) abort
  let i = len(a:a) - 1
  let j = len(a:b) - 1
  let carry = 0
  let out = ''
  while i >= 0 || j >= 0 || carry
    let s = carry
    if i >= 0 | let s += str2nr(a:a[i]) | let i -= 1 | endif
    if j >= 0 | let s += str2nr(a:b[j]) | let j -= 1 | endif
    let out = (s % 2) . out
    let carry = s / 2
  endwhile
  return out
endfunction

echo AddBinary('1010', '1011')  " 10101
