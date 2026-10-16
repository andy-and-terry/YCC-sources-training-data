" Count vowels and consonants with substitute() length tricks.
function! s:Count(s) abort
  let l:letters = substitute(a:s, '[^[:alpha:]]', '', 'g')
  let l:vowels = len(substitute(l:letters, '[^aeiouAEIOU]', '', 'g'))
  return [l:vowels, len(l:letters) - l:vowels]
endfunction
echo s:Count('Hello, World!')
echo s:Count('rhythm')
