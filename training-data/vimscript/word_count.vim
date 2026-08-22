function! WordCount(text)
  let words = split(tolower(a:text))
  let counts = {}
  for word in words
    let counts[word] = get(counts, word, 0) + 1
  endfor
  return counts
endfunction

echo WordCount('the quick brown fox jumps over the lazy dog the fox runs')
