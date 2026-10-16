" Boyer-Moore majority vote.
function! s:Majority(a) abort
  let l:cand = 0
  let l:count = 0
  for l:x in a:a
    if l:count == 0
      let l:cand = l:x
    endif
    let l:count += (l:x == l:cand) ? 1 : -1
  endfor
  return l:cand
endfunction
echo s:Majority([2, 2, 1, 1, 2, 2, 3, 2])
echo s:Majority([7, 7, 7, 1])
