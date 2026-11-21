" Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
function! IsKeith(n)
  let l:seq = map(split(string(a:n), '\zs'), 'str2nr(v:val)')
  let l:k = len(l:seq)
  while l:seq[-1] < a:n
    let l:sum = 0
    for l:v in l:seq[-l:k :]
      let l:sum += l:v
    endfor
    call add(l:seq, l:sum)
  endwhile
  return l:seq[-1] == a:n
endfunction

echo join(filter(range(10, 1199), 'IsKeith(v:val)'), ' ')
