function! Affine(text, a, b) abort
  let l:out = ''
  for l:ch in split(a:text, '\zs')
    if l:ch =~# '[A-Z]'
      let l:x = char2nr(l:ch) - 65
      let l:out .= nr2char(65 + (a:a * l:x + a:b) % 26)
    else
      let l:out .= l:ch
    endif
  endfor
  return l:out
endfunction

echo Affine('AFFINE', 5, 8)
