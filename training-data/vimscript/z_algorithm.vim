function! ZArray(s)
  let n = len(a:s)
  let z = repeat([0], n)
  let left = 0
  let right = 0

  for i in range(1, n - 1)
    if i < right
      let z[i] = min([z[i - left], right - i])
    endif
    while i + z[i] < n && a:s[z[i]] ==# a:s[i + z[i]]
      let z[i] += 1
    endwhile
    if i + z[i] > right
      let left = i
      let right = i + z[i]
    endif
  endfor
  return z
endfunction

function! ZSearch(pattern, text)
  let combined = a:pattern . "\x01" . a:text
  let z = ZArray(combined)
  let plen = len(a:pattern)
  let matches = []
  for i in range(len(z))
    if z[i] == plen
      call add(matches, i - plen - 1)
    endif
  endfor
  return matches
endfunction

echo ZSearch('aba', 'abababa')
