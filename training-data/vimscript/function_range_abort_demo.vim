function! SumRange() range abort
  let total = 0
  for lnum in range(a:firstline, a:lastline)
    let total += str2nr(getline(lnum))
  endfor
  echo 'sum of lines ' . a:firstline . '-' . a:lastline . ': ' . total
  return total
endfunction

function! Greet(name, ...) abort
  let greeting = a:0 > 0 ? a:1 : 'Hello'
  return greeting . ', ' . a:name . ' (' . a:0 . ' extra)'
endfunction

function! Risky() abort
  echo 'before'
  call nonexistent_function()
  echo 'never printed'
endfunction

new
call setline(1, ['10', '20', '30', 'x'])
call SumRange()
1,3call SumRange()
%call SumRange()
echo Greet('Vim')
echo Greet('Vim', 'Hi')
try
  call Risky()
catch /E117/
  echo 'caught: undefined function'
endtry
bwipeout!
