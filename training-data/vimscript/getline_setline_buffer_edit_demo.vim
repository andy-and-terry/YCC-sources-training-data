enew!
call setline(1, ['first line', 'second line', 'third line'])

call append(line('$'), 'fourth line')
call setline(2, 'SECOND LINE (edited)')

let total_lines = line('$')
echo total_lines

for lnum in range(1, total_lines)
  echo lnum . ': ' . getline(lnum)
endfor

let all_lines = getline(1, '$')
echo all_lines

bwipeout!
