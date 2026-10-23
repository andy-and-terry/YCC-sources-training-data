" Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
function! Tribonacci(count) abort
  let l:t = [0, 0, 1]
  while len(l:t) < a:count
    call add(l:t, l:t[-1] + l:t[-2] + l:t[-3])
  endwhile
  return l:t[0 : a:count - 1]
endfunction

echo 'Tribonacci: ' . join(Tribonacci(15), ', ')
