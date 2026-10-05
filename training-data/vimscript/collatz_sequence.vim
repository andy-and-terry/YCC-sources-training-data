function! Collatz(n)
  let n = a:n
  let seq = [n]
  while n != 1
    let n = n % 2 == 0 ? n / 2 : 3 * n + 1
    call add(seq, n)
  endwhile
  return seq
endfunction

let s = Collatz(6)
echo s
echo 'steps: ' . (len(s) - 1)
echo 'peak: ' . max(Collatz(27))
