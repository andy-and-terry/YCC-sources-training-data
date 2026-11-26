" Deficient numbers below 100; expect 76.
function! Main() abort
  let c = 0
  for n in range(1, 99)
    let t = 0
    for d in range(1, n - 1)
      if n % d == 0
        let t += d
      endif
    endfor
    if t < n
      let c += 1
    endif
  endfor
  echo c
endfunction

call Main()
