call setline(1, ['line one', 'line two', 'line three', 'line four'])

call cursor(1, 1)
normal! ma
call cursor(3, 1)
normal! mb

echo getpos("'a")[1]
echo getpos("'b")[1]

normal! `ax
echo getline(1)

call setpos("'c", [0, 4, 1, 0])
normal! `cx
echo getline(4)
