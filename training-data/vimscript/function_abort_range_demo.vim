function! s:ReportRange() range
  echo 'lines ' . a:firstline . ' to ' . a:lastline . ' (' . (a:lastline - a:firstline + 1) . ' lines)'
endfunction

new
call setline(1, range(1, 10))
2,5call s:ReportRange()
%call s:ReportRange()
call s:ReportRange()
bwipeout!

function! s:Risky(n) abort
  echo 'before'
  let l:x = 10 / a:n
  let l:undefined_use = s:nonexistent_variable
  echo 'never reached'
endfunction

try
  call s:Risky(2)
catch /E121/
  echo 'caught undefined variable'
endtry

function! s:NoAbort(n)
  let l:y = s:missing_one
  return 'reached the end'
endfunction
try
  echo s:NoAbort(1)
catch
  echo 'caught anyway'
endtry

function! s:Defaults(name, ...) abort
  let l:greeting = a:0 > 0 ? a:1 : 'Hello'
  return l:greeting . ', ' . a:name . '! (' . a:0 . ' extra)'
endfunction
echo s:Defaults('Ann')
echo s:Defaults('Bob', 'Hi')

function! s:Counter() abort
  let s:calls = get(s:, 'calls', 0) + 1
  return s:calls
endfunction
echo s:Counter() . ' ' . s:Counter() . ' ' . s:Counter()
echo exists('*s:Counter')
