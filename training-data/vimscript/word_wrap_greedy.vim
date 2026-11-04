function! WrapText(text, width) abort
  let lines = []
  let line = ''
  for word in split(a:text)
    if line !=# '' && len(line) + 1 + len(word) > a:width
      call add(lines, line)
      let line = word
    else
      let line = line ==# '' ? word : line . ' ' . word
    endif
  endfor
  if line !=# ''
    call add(lines, line)
  endif
  return lines
endfunction

for l in WrapText('the quick brown fox jumps over the lazy dog', 15)
  echo '|' . l . repeat(' ', 15 - len(l)) . '|'
endfor
