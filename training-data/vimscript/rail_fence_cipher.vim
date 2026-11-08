function! RailFence(s, rails) abort
  let rows = repeat([''], a:rails)
  let r = 0
  let dir = 1
  for ch in split(a:s, '\zs')
    let rows[r] .= ch
    if r == 0 | let dir = 1 | endif
    if r == a:rails - 1 | let dir = -1 | endif
    let r += dir
  endfor
  return join(rows, '')
endfunction

echo RailFence('WEAREDISCOVERED', 3)
