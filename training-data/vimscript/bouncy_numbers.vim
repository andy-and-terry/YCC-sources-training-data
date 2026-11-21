" Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
function! IsBouncy(n)
  let l:d = split(string(a:n), '\zs')
  let l:up = sort(copy(l:d))
  let l:down = reverse(copy(l:up))
  return l:d != l:up && l:d != l:down
endfunction

echo len(filter(range(1, 999), 'IsBouncy(v:val)'))
