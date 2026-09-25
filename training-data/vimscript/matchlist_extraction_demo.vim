let logLine = '2024-08-15 ERROR: disk full on /dev/sda1'

let parts = matchlist(logLine, '\v^(\d{4}-\d{2}-\d{2}) (\w+): (.*)$')
echo parts[1]
echo parts[2]
echo parts[3]

echo matchstr(logLine, '\d\{4}-\d\{2}-\d\{2}')
echo matchstr(logLine, '/dev/\w\+')
