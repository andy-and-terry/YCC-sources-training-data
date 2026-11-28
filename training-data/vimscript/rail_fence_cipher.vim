function! RailFence(text, k) abort
  let l:cycle = 2 * (a:k - 1)
  let l:rails = map(range(a:k), '""')
  for l:i in range(len(a:text))
    let l:r = l:i % l:cycle
    if l:r >= a:k
      let l:r = l:cycle - l:r
    endif
    let l:rails[l:r] .= a:text[l:i]
  endfor
  return join(l:rails, '')
endfunction

echo RailFence('WEAREDISCOVERED', 3)
