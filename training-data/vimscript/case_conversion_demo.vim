" Case conversion helpers: toupper, tolower, and title case via substitute().
let s:text = 'the quick brown fox'
echo toupper(s:text)
echo tolower('MiXeD CaSe')
echo substitute(s:text, '\<\(\w\)\(\w*\)\>', '\u\1\2', 'g')
echo substitute('snake_case_name', '_\(\a\)', '\u\1', 'g')
echo substitute('camelCaseName', '\(\u\)', '_\l\1', 'g')
