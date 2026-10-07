function! Collatz(n)
  let seq = [a:n]
  let n = a:n
  while n != 1
    if n % 2 == 0
      let n = n / 2
    else
      let n = 3 * n + 1
    endif
    call add(seq, n)
  endwhile
  return seq
endfunction

echo Collatz(6)
echo len(Collatz(27)) - 1
