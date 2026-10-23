function! VanEck(count)
  let terms = [0]
  let last_seen = {}
  let current = 0
  for i in range(a:count - 1)
    let next = has_key(last_seen, current) ? i - last_seen[current] : 0
    let last_seen[current] = i
    call add(terms, next)
    let current = next
  endfor
  return terms
endfunction

echo join(VanEck(20), ' ')
