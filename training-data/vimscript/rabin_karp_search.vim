function! RabinKarpSearch(text, pattern)
  let n = len(a:text)
  let m = len(a:pattern)
  if m == 0 || m > n
    return -1
  endif

  let base = 256
  let modulus = 101
  let high_order = 1
  for i in range(m - 1)
    let high_order = (high_order * base) % modulus
  endfor

  let pattern_hash = 0
  let window_hash = 0
  for i in range(m)
    let pattern_hash = (pattern_hash * base + char2nr(a:pattern[i])) % modulus
    let window_hash = (window_hash * base + char2nr(a:text[i])) % modulus
  endfor

  for i in range(n - m + 1)
    if window_hash == pattern_hash && a:text[i : i + m - 1] == a:pattern
      return i
    endif
    if i < n - m
      let window_hash = ((window_hash - char2nr(a:text[i]) * high_order) * base + char2nr(a:text[i + m])) % modulus
      if window_hash < 0
        let window_hash += modulus
      endif
    endif
  endfor
  return -1
endfunction

echo RabinKarpSearch('abxabcabcaby', 'abcaby')
echo RabinKarpSearch('hello world', 'world')
