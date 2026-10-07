new
call setline(1, [
      \ 'the quick brown fox',
      \ '',
      \ 'jumps over the lazy dog',
      \ '  indented line here',
      \ ])

let lines = getline(1, '$')
let nonblank = filter(copy(lines), 'v:val !~ "^\\s*$"')
let words = 0
for l in nonblank
  let words += len(split(l))
endfor

echo 'lines: ' . line('$')
echo 'non-blank: ' . len(nonblank)
echo 'words: ' . words
echo 'longest: ' . max(map(copy(lines), 'strlen(v:val)'))
echo 'first with "the": ' . search('the', 'nw')

call append(line('$'), 'appended')
silent %s/\s\+$//e
call setline(2, '(blank replaced)')
echo getline(1, '$')
bwipeout!
