function! Gcd(a, b) abort
  let [a, b] = [a:a, a:b]
  while b != 0
    let [a, b] = [b, a % b]
  endwhile
  return a
endfunction

function! Rho(n) abort
  if a:n % 2 == 0 | return 2 | endif
  let [x, y, d] = [2, 2, 1]
  while d == 1
    let x = (x * x + 1) % a:n
    let y = (y * y + 1) % a:n
    let y = (y * y + 1) % a:n
    let d = Gcd(abs(x - y), a:n)
  endwhile
  return d
endfunction

let p = Rho(8051)
echo '8051 =' p '*' 8051 / p
