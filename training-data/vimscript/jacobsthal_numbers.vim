" Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
function! Jacobsthal(count) abort
  let l:terms = [0, 1]
  while len(l:terms) < a:count
    call add(l:terms, l:terms[-1] + 2 * l:terms[-2])
  endwhile
  return l:terms[: a:count - 1]
endfunction

echo join(Jacobsthal(15), ' ')
