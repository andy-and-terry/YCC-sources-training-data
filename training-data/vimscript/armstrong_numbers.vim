function! IsArmstrong(n) abort
  let l:digits = map(split(string(a:n), '\zs'), 'str2nr(v:val)')
  let l:sum = 0
  for l:d in l:digits
    let l:sum += float2nr(pow(l:d, len(l:digits)))
  endfor
  return l:sum == a:n
endfunction

echo join(filter(range(1, 999), 'IsArmstrong(v:val)'), ' ') " 1..9 153 370 371 407
