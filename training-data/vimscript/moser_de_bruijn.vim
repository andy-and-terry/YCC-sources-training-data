" Moser-de Bruijn sequence: binary digits of n read in base 4.
function! Moser(n)
  let l:n = a:n
  let l:result = 0
  let l:place = 1
  while l:n > 0
    if l:n % 2 == 1
      let l:result += l:place
    endif
    let l:n = l:n / 2
    let l:place = l:place * 4
  endwhile
  return l:result
endfunction

echo join(map(range(0, 11), 'Moser(v:val)'), ' ')
