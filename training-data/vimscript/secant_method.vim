function! Secant(F, x0, x1) abort
  let x0 = a:x0
  let x1 = a:x1
  for i in range(50)
    let f0 = a:F(x0)
    let f1 = a:F(x1)
    if f1 == f0 | break | endif
    let next = x1 - f1 * (x1 - x0) / (f1 - f0)
    let x0 = x1
    let x1 = next
    if abs(x1 - x0) < 1.0e-12 | break | endif
  endfor
  return x1
endfunction

echo printf('%.10f', Secant({x -> x * x - 2.0}, 1.0, 2.0))
