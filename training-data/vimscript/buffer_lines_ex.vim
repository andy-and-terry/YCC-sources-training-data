function! CountWords() abort
  let words = 0
  for line in getline(1, '$')
    let words += len(split(line))
  endfor
  return words
endfunction
echo 'lines:' line('$') 'words:' CountWords()
