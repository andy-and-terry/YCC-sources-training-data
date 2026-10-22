function! ProperSum(n)
  let sum = 0
  for d in range(1, a:n / 2)
    if a:n % d == 0
      let sum += d
    endif
  endfor
  return sum
endfunction

function! Aliquot(start)
  let terms = [a:start]
  while terms[-1] != 0
    call add(terms, ProperSum(terms[-1]))
  endwhile
  return terms
endfunction

echo join(Aliquot(12), ' ')
