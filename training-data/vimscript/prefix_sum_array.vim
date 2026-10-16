" Prefix sums and O(1) range-sum queries.
function! s:Prefix(arr) abort
  let l:p = [0]
  for l:x in a:arr
    call add(l:p, l:p[-1] + l:x)
  endfor
  return l:p
endfunction
let s:data = [3, 1, 4, 1, 5, 9, 2, 6]
let s:p = s:Prefix(s:data)
echo s:p
echo s:p[5] - s:p[2]
echo s:p[8] - s:p[0]
