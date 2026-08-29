function! WordFrequency(text)
  let freq = {}
  for word in split(tolower(a:text), ' ')
    let freq[word] = get(freq, word, 0) + 1
  endfor
  return freq
endfunction

echo WordFrequency('the quick brown fox the lazy fox')
