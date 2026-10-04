function! Collatz(n) abort
  let seq = [a:n]
  let n = a:n
  while n != 1
    let n = n % 2 == 0 ? n / 2 : 3 * n + 1
    call add(seq, n)
  endwhile
  return seq
endfunction

for start in [6, 7, 27]
  let seq = Collatz(start)
  echo 'start=' . start . ' steps=' . (len(seq) - 1) . ' max=' . max(seq)
endfor
echo Collatz(6)
