function! IsPrime(n) abort
  if a:n < 2 | return 0 | endif
  let l:i = 2
  while l:i * l:i <= a:n
    if a:n % l:i == 0 | return 0 | endif
    let l:i += 1
  endwhile
  return 1
endfunction

function! IsPalindrome(n) abort
  let l:s = string(a:n)
  return l:s ==# join(reverse(split(l:s, '\zs')), '')
endfunction

echo join(filter(range(2, 199), 'IsPalindrome(v:val) && IsPrime(v:val)'), ' ')
" 2 3 5 7 11 101 131 151 181 191
