function! Jaccard(a, b) abort
  let l:inter = len(filter(uniq(sort(copy(a:a), 'n')), 'index(a:b, v:val) >= 0'))
  let l:union = len(uniq(sort(a:a + a:b, 'n')))
  return l:union == 0 ? 1.0 : l:inter / str2float(l:union)
endfunction

echo Jaccard([1, 2, 3, 4], [3, 4, 5])
