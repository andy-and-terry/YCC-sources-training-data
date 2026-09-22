" Fast modular exponentiation via binary exponentiation (square-and-multiply).
function! ModPow(base, exp, modulus)
  if a:modulus == 1
    return 0
  endif
  let result = 1
  let b = a:base % a:modulus
  let e = a:exp
  while e > 0
    if and(e, 1) == 1
      let result = (result * b) % a:modulus
    endif
    let e = e / 2
    let b = (b * b) % a:modulus
  endwhile
  return result
endfunction

echo ModPow(2, 10, 1000)
echo ModPow(7, 128, 13)
echo ModPow(5, 0, 7)
