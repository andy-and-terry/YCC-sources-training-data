" search(), searchpair() and match highlighting on a scratch buffer
new
call setline(1, [
  \ 'function main() {',
  \ '  if (x) {',
  \ '    call(a, b)',
  \ '  }',
  \ '}',
  \ 'TODO: finish',
  \ 'done',
  \ ])

" search() returns the line number of the match, 0 if none
call cursor(1, 1)
echo 'TODO at line: ' . search('TODO')
echo 'missing: ' . search('NOPE')

" 'n' flag does not move the cursor
call cursor(1, 1)
echo 'next "if" line: ' . search('\<if\>', 'n')
echo 'cursor still at: ' . line('.')

" searchpair finds the matching bracket across nested pairs
call cursor(1, 17)
let close = searchpair('{', '', '}', 'W')
echo 'match for { on line 1: line ' . close

" Collect all matching lines
let hits = []
call cursor(1, 1)
while search('[a-z]\+(', 'W') > 0
  call add(hits, line('.'))
endwhile
echo 'lines with calls: ' . string(hits)

bwipeout!
