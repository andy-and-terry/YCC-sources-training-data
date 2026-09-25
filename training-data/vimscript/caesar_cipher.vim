function! ShiftChar(c, shift)
  let code = char2nr(a:c)
  if code >= char2nr('a') && code <= char2nr('z')
    return nr2char((code - char2nr('a') + a:shift) % 26 + char2nr('a'))
  elseif code >= char2nr('A') && code <= char2nr('Z')
    return nr2char((code - char2nr('A') + a:shift) % 26 + char2nr('A'))
  endif
  return a:c
endfunction

function! CaesarEncode(str, shift)
  return join(map(split(a:str, '\zs'), 'ShiftChar(v:val, a:shift)'), '')
endfunction

function! CaesarDecode(str, shift)
  return CaesarEncode(a:str, 26 - (a:shift % 26))
endfunction

let encoded = CaesarEncode('Attack at Dawn!', 3)
echo encoded
echo CaesarDecode(encoded, 3)
