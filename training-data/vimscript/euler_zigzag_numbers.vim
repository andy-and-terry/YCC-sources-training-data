" Euler zigzag numbers via the Seidel-Entringer boustrophedon.
let s:row = [1]
let s:out = [1]
for s:i in range(9)
  let s:next = [0]
  for s:x in reverse(copy(s:row))
    call add(s:next, s:next[-1] + s:x)
  endfor
  let s:row = s:next
  call add(s:out, s:row[-1])
endfor
echo join(s:out, ' ')
