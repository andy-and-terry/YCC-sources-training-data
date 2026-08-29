function! BuildLps(pattern)
  let n = len(a:pattern)
  let lps = repeat([0], n)
  let len_ = 0
  let i = 1
  while i < n
    if a:pattern[i] ==# a:pattern[len_]
      let len_ += 1
      let lps[i] = len_
      let i += 1
    elseif len_ != 0
      let len_ = lps[len_ - 1]
    else
      let lps[i] = 0
      let i += 1
    endif
  endwhile
  return lps
endfunction

function! KmpSearch(text, pattern)
  let lps = BuildLps(a:pattern)
  let n = len(a:text)
  let m = len(a:pattern)
  let i = 0
  let j = 0
  while i < n
    if a:text[i] ==# a:pattern[j]
      let i += 1
      let j += 1
      if j == m
        return i - j
      endif
    elseif j > 0
      let j = lps[j - 1]
    else
      let i += 1
    endif
  endwhile
  return -1
endfunction

echo KmpSearch('abxabcabcaby', 'abcaby')
