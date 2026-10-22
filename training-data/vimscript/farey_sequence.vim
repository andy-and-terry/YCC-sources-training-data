function! Farey(n)
  let terms = []
  let [a, b, c, d] = [0, 1, 1, a:n]
  while 1
    call add(terms, a . '/' . b)
    if a == 1 && b == 1
      break
    endif
    let k = (a:n + b) / d
    let [a, b, c, d] = [c, d, k * c - a, k * d - b]
  endwhile
  return terms
endfunction

echo join(Farey(5), ' ')
