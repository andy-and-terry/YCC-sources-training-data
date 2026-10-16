" Compute maximum nesting depth of brackets in a string.
function! s:MaxDepth(s) abort
  let l:d = 0
  let l:best = 0
  for l:c in split(a:s, '\zs')
    if l:c =~# '[([{]'
      let l:d += 1
      let l:best = max([l:best, l:d])
    elseif l:c =~# '[)\]}]'
      let l:d -= 1
    endif
  endfor
  return l:d == 0 ? l:best : -1
endfunction
echo s:MaxDepth('(a[b{c}d]e)')
echo s:MaxDepth('((()))')
echo s:MaxDepth('(()')
