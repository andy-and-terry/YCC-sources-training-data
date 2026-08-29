function! IsValid(str)
  let pairs = {')': '(', ']': '[', '}': '{'}
  let stack = []
  for c in split(a:str, '\zs')
    if c ==# '(' || c ==# '[' || c ==# '{'
      call add(stack, c)
    elseif has_key(pairs, c)
      if empty(stack) || stack[-1] !=# pairs[c]
        return 0
      endif
      call remove(stack, -1)
    endif
  endfor
  return empty(stack)
endfunction

echo IsValid('{[()]}')
echo IsValid('{[(])}')
