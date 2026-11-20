" Aliquot sum classification.
function! Aliquot(n) abort
  return eval(join([0] + filter(range(1, a:n - 1), {_, d -> a:n % d == 0}), '+'))
endfunction
for n in [6, 12, 15, 28]
  let a = Aliquot(n)
  echo n a (a == n ? 'perfect' : a > n ? 'abundant' : 'deficient')
endfor
