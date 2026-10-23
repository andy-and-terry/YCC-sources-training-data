" strftime formats a timestamp; passing a fixed value makes output stable
let s:epoch = 86400 * 365

echo strftime('%Y-%m-%d', s:epoch)
echo strftime('%H:%M:%S', 3661)
echo strftime('%j', s:epoch)

" localtime() returns the current time in seconds
let s:now = localtime()
echo s:now > s:epoch ? 'now is after the fixed date' : 'clock looks wrong'

" differences are plain integer arithmetic
let s:elapsed = s:now - s:epoch
echo 'elapsed days is positive: ' . (s:elapsed / 86400 > 0)
