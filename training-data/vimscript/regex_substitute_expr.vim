let s = substitute('hello world', '\<\(\w\)', '\u\1', 'g')
echo s
echo matchstr('abc123', '\d\+')
