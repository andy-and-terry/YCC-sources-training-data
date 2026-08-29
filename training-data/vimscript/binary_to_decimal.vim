function! BinaryToDecimal(s)
  return str2nr(a:s, 2)
endfunction

echo BinaryToDecimal('1011')
