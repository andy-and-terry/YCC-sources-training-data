call setline(1, ['apple', 'banana', 'cherry'])

" duplicate the first line using the yank-and-put keys
normal! yyp
echo getline(1, '$')

" append '!' to every non-blank line: the classic :global + :normal idiom
g/./normal! A!
echo getline(1, '$')
