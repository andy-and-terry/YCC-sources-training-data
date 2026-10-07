function! Add(a, b) abort
  return a:a + a:b
endfunction

function! Sub(a, b) abort
  return a:a - a:b
endfunction

let s:ops = {
      \ '+': function('Add'),
      \ '-': function('Sub'),
      \ '*': {a, b -> a * b},
      \ '/': {a, b -> b == 0 ? 'div by zero' : a / b},
      \ }

function! Calc(a, op, b) abort
  if !has_key(s:ops, a:op)
    return 'unknown op ' . a:op
  endif
  return s:ops[a:op](a:a, a:b)
endfunction

echo Calc(6, '+', 3)
echo Calc(6, '-', 3)
echo Calc(6, '*', 3)
echo Calc(6, '/', 0)
echo Calc(6, '%', 3)
