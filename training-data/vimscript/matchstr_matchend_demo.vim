" matchstr, match, matchend, matchstrpos.
let s:line = 'error: file not found at line 42'
echo match(s:line, 'file')
echo matchend(s:line, 'file')
echo matchstr(s:line, '\d\+')
echo matchstr(s:line, '^\w\+')
echo matchstrpos(s:line, 'not \w\+')
echo match(s:line, 'xyz')
echo match(['a', 'bb', 'ccc'], 'b\+')
