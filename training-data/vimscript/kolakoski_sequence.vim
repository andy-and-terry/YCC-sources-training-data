function! Kolakoski(count)
  let terms = [1, 2, 2]
  let r = 2
  let v = 1
  while len(terms) < a:count
    call extend(terms, repeat([v], terms[r]))
    let v = 3 - v
    let r += 1
  endwhile
  return terms[0 : a:count - 1]
endfunction

echo join(Kolakoski(20), ' ')
