" Happy numbers reach 1 under repeated sum of squared digits.
function! s:Step(n) abort
  let l:s = 0
  for l:d in split(string(a:n), '\zs')
    let l:s += l:d * l:d
  endfor
  return l:s
endfunction
function! s:IsHappy(n) abort
  let l:seen = {}
  let l:x = a:n
  while l:x != 1 && !has_key(l:seen, l:x)
    let l:seen[l:x] = 1
    let l:x = s:Step(l:x)
  endwhile
  return l:x == 1
endfunction
echo filter(range(1, 50), {_, v -> s:IsHappy(v)})
