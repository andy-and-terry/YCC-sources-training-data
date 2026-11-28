let tails = []
for x in [10, 9, 2, 5, 3, 7, 101, 18]
  let i = 0
  while i < len(tails) && tails[i] < x
    let i += 1
  endwhile
  if i == len(tails)
    call add(tails, x)
  else
    let tails[i] = x
  endif
endfor
echo len(tails)
