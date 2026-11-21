" Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
function! IsMunchausen(n)
  let l:sum = 0
  for l:c in split(string(a:n), '\zs')
    let l:d = str2nr(l:c)
    if l:d > 0
      let l:sum += float2nr(pow(l:d, l:d))
    endif
  endfor
  return l:sum == a:n
endfunction

echo join(filter(range(1, 4999), 'IsMunchausen(v:val)'), ' ')
