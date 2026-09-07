function! RleEncode(s)
  if empty(a:s)
    return ''
  endif
  let result = ''
  let count = 1
  let prev = a:s[0]
  for c in a:s[1:]
    if c == prev
      let count += 1
    else
      let result .= prev . count
      let prev = c
      let count = 1
    endif
  endfor
  let result .= prev . count
  return result
endfunction

function! RleDecode(s)
  let result = ''
  let i = 0
  while i < len(a:s)
    let ch = a:s[i]
    let i += 1
    let num = ''
    while i < len(a:s) && a:s[i] =~ '\d'
      let num .= a:s[i]
      let i += 1
    endwhile
    let result .= repeat(ch, str2nr(num))
  endwhile
  return result
endfunction

let encoded = RleEncode('aaabbbcccca')
echo encoded
echo RleDecode(encoded)
