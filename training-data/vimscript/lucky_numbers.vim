function! Lucky(limit)
  let numbers = range(1, a:limit - 1, 2)
  let idx = 1
  while idx < len(numbers) && numbers[idx] <= len(numbers)
    let step = numbers[idx]
    let kept = []
    for k in range(len(numbers))
      if (k + 1) % step != 0
        call add(kept, numbers[k])
      endif
    endfor
    let numbers = kept
    let idx += 1
  endwhile
  return numbers
endfunction

echo join(Lucky(100), ' ')
