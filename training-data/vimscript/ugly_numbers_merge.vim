function! Ugly(n) abort
  let seq = [1]
  let [i2, i3, i5] = [0, 0, 0]
  while len(seq) < a:n
    let c2 = seq[i2] * 2
    let c3 = seq[i3] * 3
    let c5 = seq[i5] * 5
    let next = min([c2, c3, c5])
    call add(seq, next)
    if next == c2 | let i2 += 1 | endif
    if next == c3 | let i3 += 1 | endif
    if next == c5 | let i5 += 1 | endif
  endwhile
  return seq[a:n - 1]
endfunction

echo join(map(range(1, 12), {_, i -> Ugly(i)}), ' ')
