" Disarium numbers: digits raised to their 1-based positions sum to n.
function! IsDisarium(n)
  let l:sum = 0
  let l:i = 0
  for l:c in split(string(a:n), '\zs')
    let l:i += 1
    let l:sum += float2nr(pow(str2nr(l:c), l:i))
  endfor
  return l:sum == a:n
endfunction

echo join(filter(range(1, 999), 'IsDisarium(v:val)'), ' ')
