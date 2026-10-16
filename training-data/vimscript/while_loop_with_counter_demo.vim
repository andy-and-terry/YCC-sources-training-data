" while loops with continue, break and a compound condition.
let s:i = 0
let s:sum = 0
while s:i < 20
  let s:i += 1
  if s:i % 2 == 0
    continue
  endif
  if s:sum > 40
    break
  endif
  let s:sum += s:i
endwhile
echo 'i=' . s:i . ' sum=' . s:sum
