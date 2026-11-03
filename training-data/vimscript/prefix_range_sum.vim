let s:values = [3, 1, 4, 1, 5, 9, 2, 6]
let s:prefix = [0]
for s:v in s:values
  call add(s:prefix, s:prefix[-1] + s:v)
endfor

function! RangeQuery(lo, hi) abort
  return s:prefix[a:hi] - s:prefix[a:lo]
endfunction

echo RangeQuery(2, 5)
