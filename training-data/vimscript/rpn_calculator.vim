function! EvalRPN(expr)
  let stack = []
  for tok in split(a:expr)
    if tok =~# '^-\?\d\+$'
      call add(stack, str2nr(tok))
    else
      let b = remove(stack, -1)
      let a = remove(stack, -1)
      if tok ==# '+'
        call add(stack, a + b)
      elseif tok ==# '-'
        call add(stack, a - b)
      elseif tok ==# '*'
        call add(stack, a * b)
      elseif tok ==# '/'
        call add(stack, a / b)
      else
        throw 'unknown operator: ' . tok
      endif
    endif
  endfor
  return stack[0]
endfunction

echo EvalRPN('3 4 + 2 *')
echo EvalRPN('5 1 2 + 4 * + 3 -')
