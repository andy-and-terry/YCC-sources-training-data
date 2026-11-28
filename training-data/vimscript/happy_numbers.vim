function! IsHappy(n) abort
  let l:n = a:n
  let l:seen = {}
  while l:n != 1 && !has_key(l:seen, l:n)
    let l:seen[l:n] = 1
    let l:s = 0
    for l:d in split(string(l:n), '\zs')
      let l:s += str2nr(l:d) * str2nr(l:d)
    endfor
    let l:n = l:s
  endwhile
  return l:n == 1
endfunction

let s:found = []
let s:n = 1
while len(s:found) < 8
  if IsHappy(s:n) | call add(s:found, s:n) | endif
  let s:n += 1
endwhile
echo join(s:found, ' ') " 1 7 10 13 19 23 28 31
