function! Recaman(count)
  let terms = [0]
  let seen = {0: 1}
  let prev = 0
  for i in range(1, a:count - 1)
    let next = prev - i
    if next <= 0 || has_key(seen, next)
      let next = prev + i
    endif
    let seen[next] = 1
    call add(terms, next)
    let prev = next
  endfor
  return terms
endfunction

echo join(Recaman(20), ' ')
