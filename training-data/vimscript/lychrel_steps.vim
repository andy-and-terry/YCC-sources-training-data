" Reverse-and-add until a palindrome; count the steps.
function! ReverseDigits(n)
  return str2nr(join(reverse(split(string(a:n), '\zs')), ''))
endfunction

function! Steps(start)
  let l:n = a:start
  for l:count in range(50)
    if l:count > 0 && l:n == ReverseDigits(l:n)
      return l:count
    endif
    let l:n += ReverseDigits(l:n)
  endfor
  return -1
endfunction

echo join(map([56, 57, 59, 79, 89], 'Steps(v:val)'), ' ')
