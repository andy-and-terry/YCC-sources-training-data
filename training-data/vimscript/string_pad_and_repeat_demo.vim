" Pad strings to a fixed width and repeat characters.
function! s:PadRight(str, width, ...) abort
  let l:ch = a:0 > 0 ? a:1 : ' '
  let l:missing = a:width - strchars(a:str)
  return l:missing > 0 ? a:str . repeat(l:ch, l:missing) : a:str
endfunction

function! s:PadLeft(str, width, ...) abort
  let l:ch = a:0 > 0 ? a:1 : ' '
  let l:missing = a:width - strchars(a:str)
  return l:missing > 0 ? repeat(l:ch, l:missing) . a:str : a:str
endfunction

echo '[' . s:PadRight('abc', 8) . ']'
echo '[' . s:PadLeft('42', 6, '0') . ']'
echo repeat('-=', 5)
echo repeat([0], 4)
