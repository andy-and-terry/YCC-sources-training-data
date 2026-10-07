for i in range(3)
  echo 'range' i
endfor

for item in ['a', 'b', 'c']
  echo item
endfor

for [k, v] in items({'x': 1, 'y': 2})
  echo k . '=' . v
endfor

for [a, b] in [[1, 2], [3, 4]]
  echo a + b
endfor

let i = 0
while i < 10
  let i += 1
  if i % 2 == 0
    continue
  endif
  if i > 7
    break
  endif
  echo 'odd' i
endwhile

let [first, second; rest] = [1, 2, 3, 4, 5]
echo first second rest
