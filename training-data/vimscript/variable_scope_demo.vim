let g:counter = 100

function! s:LocalHelper()
  let l:local_value = 5
  return l:local_value * 2
endfunction

function! ScopeDemo(arg)
  let l:local_value = a:arg + s:LocalHelper()
  let g:counter = g:counter + 1
  return l:local_value
endfunction

echo ScopeDemo(1)
echo ScopeDemo(2)
echo g:counter
