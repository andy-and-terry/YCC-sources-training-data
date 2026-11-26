" Squarefree numbers up to 100; expect 61.
function! Main() abort
  let c = 0
  for n in range(1, 100)
    let ok = 1
    let d = 2
    while d * d <= n
      if n % (d * d) == 0
        let ok = 0
      endif
      let d += 1
    endwhile
    let c += ok
  endfor
  echo c
endfunction

call Main()
