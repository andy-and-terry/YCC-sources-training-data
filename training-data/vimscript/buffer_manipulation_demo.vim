call setline(1, ['one', 'two', 'three'])
call append(3, 'four')

let all_lines = getline(1, '$')
echo all_lines

call setline(2, toupper(getline(2)))
echo getline(2)

echo line('$')
