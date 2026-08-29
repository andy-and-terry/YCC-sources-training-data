function! NormalizeStr(s)
  let chars = split(substitute(tolower(a:s), ' ', '', 'g'), '\zs')
  return sort(chars)
endfunction

function! IsAnagram(a, b)
  return NormalizeStr(a:a) ==# NormalizeStr(a:b)
endfunction

echo IsAnagram('listen', 'silent')
echo IsAnagram('hello', 'world')
