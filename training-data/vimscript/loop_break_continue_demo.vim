for i in range(10)
  if i == 2
    continue
  endif
  if i == 6
    break
  endif
  echo 'i=' . i
endfor

let n = 0
while n < 10
  let n += 1
  if n % 2
    continue
  endif
  echo 'even ' . n
  if n >= 6
    break
  endif
endwhile

let found = ''
for row in [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  for v in row
    if v == 5
      let found = v
      break
    endif
  endfor
  if found !=# ''
    break
  endif
endfor
echo 'found ' . found

for [key, value] in items({'a': 1, 'b': 2})
  echo key . '=' . value
endfor

for [x, y] in [[1, 'one'], [2, 'two']]
  echo x . ':' . y
endfor

let total = 0
for idx in range(10, 1, -3)
  let total += idx
endfor
echo total

let s = ''
for ch in split('abc', '\zs')
  let s = ch . s
endfor
echo s

let i = 0
while 1
  let i += 1
  if i > 3 | break | endif
endwhile
echo i
echo range(3, 15, 4)
