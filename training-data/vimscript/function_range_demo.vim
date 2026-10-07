function! SumRange() range
  let total = 0
  for lnum in range(a:firstline, a:lastline)
    let total += str2nr(getline(lnum))
  endfor
  return total
endfunction

function! Greet(name, ...) abort
  let greeting = a:0 >= 1 ? a:1 : 'Hello'
  return greeting . ', ' . a:name . '! (' . a:0 . ' extra)'
endfunction

new
call setline(1, ['10', '20', '30', '40'])
echo SumRange()
echo 'lines 2-3: ' . (str2nr(getline(2)) + str2nr(getline(3)))
echo Greet('Ann')
echo Greet('Bob', 'Howdy')
bwipeout!
