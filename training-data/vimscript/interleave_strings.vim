function! Interleave(...) abort
  let longest = max(map(copy(a:000), {_, s -> len(s)}))
  let out = ''
  for i in range(longest)
    for s in a:000
      if i < len(s)
        let out .= s[i]
      endif
    endfor
  endfor
  return out
endfunction

echo Interleave('abc', '12345')
echo Interleave('ab', 'cd', 'efg')
