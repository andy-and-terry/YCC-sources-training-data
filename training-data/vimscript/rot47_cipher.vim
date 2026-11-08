function! Rot47(s) abort
  let out = ''
  for ch in split(a:s, '\zs')
    let n = char2nr(ch)
    if n >= 33 && n <= 126
      let n = 33 + (n - 33 + 47) % 94
    endif
    let out .= nr2char(n)
  endfor
  return out
endfunction

let e = Rot47('Hello, World!')
echo e Rot47(e)
