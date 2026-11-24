" Aliquot sequence: replace n by the sum of its proper divisors.
function! AliquotSum(n)
  let l:s = 0
  for l:d in range(1, a:n / 2)
    if a:n % l:d == 0
      let l:s += l:d
    endif
  endfor
  return l:s
endfunction

let s:seq = [12]
while s:seq[-1] > 1 && len(s:seq) < 20
  call add(s:seq, AliquotSum(s:seq[-1]))
endwhile
echo join(s:seq, ' ')
