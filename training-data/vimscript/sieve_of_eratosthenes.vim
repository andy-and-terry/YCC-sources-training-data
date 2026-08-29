function! Sieve(limit)
  let is_composite = repeat([0], a:limit + 1)
  let i = 2
  while i * i <= a:limit
    if !is_composite[i]
      let j = i * i
      while j <= a:limit
        let is_composite[j] = 1
        let j += i
      endwhile
    endif
    let i += 1
  endwhile
  let result = []
  for n in range(2, a:limit)
    if !is_composite[n]
      call add(result, n)
    endif
  endfor
  return result
endfunction

echo Sieve(50)
