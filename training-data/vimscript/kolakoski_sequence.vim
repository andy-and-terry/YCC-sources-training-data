function! Kolakoski(count)
  let terms = [1, 2, 2]
  let i = 2
  while len(terms) < a:count
    let value = 3 - terms[-1]
    for j in range(terms[i])
      call add(terms, value)
    endfor
    let i += 1
  endwhile
  return terms[0 : a:count - 1]
endfunction

echo join(Kolakoski(20), ' ')
