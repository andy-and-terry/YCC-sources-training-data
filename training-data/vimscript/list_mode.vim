function! Modes(items) abort
  let l:counts = {}
  for l:x in a:items
    let l:counts[l:x] = get(l:counts, l:x, 0) + 1
  endfor
  let l:top = max(values(l:counts))
  let l:keys = filter(keys(l:counts), {_, k -> l:counts[k] == l:top})
  return sort(map(l:keys, 'str2nr(v:val)'), 'n')
endfunction

echo Modes([1, 2, 2, 3, 3, 4])
