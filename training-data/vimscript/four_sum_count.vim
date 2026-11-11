function! FourSumCount(a, b, c, d) abort
  let sums = {}
  for x in a:a
    for y in a:b
      let sums[x + y] = get(sums, x + y, 0) + 1
    endfor
  endfor
  let count = 0
  for x in a:c
    for y in a:d
      let count += get(sums, -(x + y), 0)
    endfor
  endfor
  return count
endfunction

echo FourSumCount([1, 2], [-2, -1], [-1, 2], [0, 2])  " 2
