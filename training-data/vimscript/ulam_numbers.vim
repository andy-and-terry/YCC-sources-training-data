function! Ulam(count)
  let terms = [1, 2]
  let c = 3
  while len(terms) < a:count
    let ways = 0
    for x in terms
      if 2 * x < c && index(terms, c - x) >= 0
        let ways += 1
      endif
    endfor
    if ways == 1
      call add(terms, c)
    endif
    let c += 1
  endwhile
  return terms
endfunction

echo join(Ulam(15), ' ')
