function! Persistence(n)
  let n = a:n
  let steps = 0
  while n >= 10
    let product = 1
    for ch in split(string(n), '\zs')
      let product = product * str2nr(ch)
    endfor
    let n = product
    let steps += 1
  endwhile
  return steps
endfunction

for n in [39, 77, 999, 10]
  echo n Persistence(n)
endfor
