function! RabinKarpSearch(text, pattern)
  let n = len(a:text)
  let m = len(a:pattern)
  if m > n
    return -1
  endif
  let base = 256
  let modulus = 101

  let pattern_hash = 0
  let text_hash = 0
  let high_order = 1
  let i = 0
  while i < m - 1
    let high_order = (high_order * base) % modulus
    let i += 1
  endwhile

  let i = 0
  while i < m
    let pattern_hash = (pattern_hash * base + char2nr(a:pattern[i])) % modulus
    let text_hash = (text_hash * base + char2nr(a:text[i])) % modulus
    let i += 1
  endwhile

  let i = 0
  while i <= n - m
    if pattern_hash == text_hash && a:text[i : i + m - 1] ==# a:pattern
      return i
    endif
    if i < n - m
      let text_hash = ((text_hash - char2nr(a:text[i]) * high_order) * base + char2nr(a:text[i + m])) % modulus
      if text_hash < 0
        let text_hash += modulus
      endif
    endif
    let i += 1
  endwhile

  return -1
endfunction

echo RabinKarpSearch('abxabcabcaby', 'abcaby')
echo RabinKarpSearch('hello world', 'world')
echo RabinKarpSearch('hello world', 'xyz')
