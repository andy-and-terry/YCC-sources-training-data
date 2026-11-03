function! CountVowels(s) abort
  let l:text = tolower(a:s)
  let l:out = {}
  for l:v in split('aeiou', '\zs')
    let l:out[l:v] = len(split(l:text, l:v, 1)) - 1
  endfor
  return l:out
endfunction

echo CountVowels("Education is beautiful")
