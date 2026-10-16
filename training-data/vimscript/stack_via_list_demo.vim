" A stack implemented with list push/pop idioms.
let s:stack = []
for s:v in range(1, 5)
  call add(s:stack, s:v * s:v)
endfor
echo s:stack
echo remove(s:stack, -1)
echo s:stack[-1]
echo len(s:stack)
while !empty(s:stack)
  echo 'pop' remove(s:stack, -1)
endwhile
