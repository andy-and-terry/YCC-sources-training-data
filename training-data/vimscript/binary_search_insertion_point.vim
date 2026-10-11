" Lower-bound binary search: first index whose value is >= target.
function! s:LowerBound(a, t) abort
  let l:lo = 0
  let l:hi = len(a:a)
  while l:lo < l:hi
    let l:mid = (l:lo + l:hi) / 2
    if a:a[l:mid] < a:t
      let l:lo = l:mid + 1
    else
      let l:hi = l:mid
    endif
  endwhile
  return l:lo
endfunction
let s:s = [1, 3, 3, 5, 8, 13]
echo s:LowerBound(s:s, 3) s:LowerBound(s:s, 4) s:LowerBound(s:s, 100) s:LowerBound(s:s, 0)
