" Using \= in substitute() to compute the replacement.
let s:text = 'prices: 3, 10, 25'
echo substitute(s:text, '\d\+', '\=submatch(0) * 2', 'g')
echo substitute('a1b2', '\d', '\="<" . submatch(0) . ">"', 'g')
echo substitute('2024-05-09', '\(\d\+\)-\(\d\+\)-\(\d\+\)', '\3/\2/\1', '')
function! s:Square(m) abort
  return a:m * a:m
endfunction
echo substitute('2 3 4', '\d', '\=s:Square(submatch(0))', 'g')
