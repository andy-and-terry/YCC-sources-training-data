for i in range(1, 5)
  if i == 2 | continue | endif
  if i == 4 | break | endif
  echo 'i=' . i
endfor
let i = 0
while i < 3
  let i += 1
endwhile
echo i
for [k, v] in items({'x': 1, 'y': 2})
  echo k . '=' . v
endfor
for [a, b] in [[1, 2], [3, 4]] | echo a + b | endfor
try
  throw 'custom error'
catch /custom/
  echo 'caught: ' . v:exception
finally
  echo 'cleanup'
endtry
try
  let x = 1 / 0
catch /E1154/
  echo 'division by zero'
endtry
try
  call nonexistent_function()
catch /E117/
  echo 'unknown function'
endtry
try | echoerr 'boom' | catch | echo v:exception | endtry
echo 1 ? 'truthy' : 'falsy' 0 ? 'truthy' : 'falsy' '' ? 't' : 'f'
echo (1 && 0) (1 || 0) !1 (1 == 1.0)
