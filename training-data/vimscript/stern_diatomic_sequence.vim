function! Stern(count)
  let terms = [0, 1]
  for n in range(2, a:count - 1)
    if n % 2 == 0
      call add(terms, terms[n / 2])
    else
      call add(terms, terms[n / 2] + terms[n / 2 + 1])
    endif
  endfor
  return terms
endfunction

echo join(Stern(20), ' ')
