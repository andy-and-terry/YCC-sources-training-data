function! Encode(text, rails) abort
  let rows = map(range(a:rails), '""')
  let r = 0
  let step = 1
  for ch in split(a:text, '\zs')
    let rows[r] .= ch
    if r == 0
      let step = 1
    elseif r == a:rails - 1
      let step = -1
    endif
    let r += step
  endfor
  return join(rows, '')
endfunction

echo Encode('WEAREDISCOVERED', 3)
