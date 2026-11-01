let i = 0
while i < 3
  echo 'while' i
  let i += 1
endwhile
for n in range(3, 1, -1)
  if n == 2 | continue | endif
  echo 'for' n
endfor
