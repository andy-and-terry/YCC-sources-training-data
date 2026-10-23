function! Ulam(count)
  let terms = [1, 2]
  let candidate = 3
  while len(terms) < a:count
    let ways = 0
    for i in range(len(terms))
      for j in range(i + 1, len(terms) - 1)
        if terms[i] + terms[j] == candidate
          let ways += 1
        endif
      endfor
    endfor
    if ways == 1
      call add(terms, candidate)
    endif
    let candidate += 1
  endwhile
  return terms
endfunction

echo join(Ulam(15), ' ')
