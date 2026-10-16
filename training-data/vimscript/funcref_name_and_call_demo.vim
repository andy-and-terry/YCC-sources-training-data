" function() and call() invoke functions by name or reference.
function! s:Mul(a, b) abort
  return a:a * a:b
endfunction
let s:F = function('s:Mul')
echo s:F(6, 7)
echo call(s:F, [3, 4])
echo call('max', [[4, 9, 2]])
let s:Double = function('s:Mul', [2])
echo s:Double(21)
echo type(s:F) == v:t_func
echo exists('*s:Mul')
