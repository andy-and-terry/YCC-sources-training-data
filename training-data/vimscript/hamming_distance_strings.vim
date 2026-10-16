" Hamming distance between equal-length strings.
function! s:Hamming(a, b) abort
  if strchars(a:a) != strchars(a:b)
    throw 'length mismatch'
  endif
  let l:d = 0
  for l:i in range(strchars(a:a))
    if strcharpart(a:a, l:i, 1) !=# strcharpart(a:b, l:i, 1)
      let l:d += 1
    endif
  endfor
  return l:d
endfunction
echo s:Hamming('karolin', 'kathrin')
echo s:Hamming('1011101', '1001001')
try
  echo s:Hamming('ab', 'abc')
catch
  echo v:exception
endtry
