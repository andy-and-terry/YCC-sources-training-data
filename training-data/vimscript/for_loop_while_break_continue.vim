for i in range(1, 10)
  if i % 2 == 0 | continue | endif
  if i > 7 | break | endif
  echo i
endfor
let n = 3
while n > 0
  echo 'n=' . n
  let n -= 1
endwhile
