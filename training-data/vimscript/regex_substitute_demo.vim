let text = 'The year is 2024 and the month is 08'
let matches = []
call substitute(text, '\d\+', '\=add(matches, submatch(0))', 'g')
echo matches

let result = substitute('hello world', '\v(\w+) (\w+)', '\2 \1', '')
echo result
