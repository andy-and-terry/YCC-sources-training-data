function! DigitSquareSum(n) abort
  let l:digits = split(string(abs(a:n)), '\zs')
  return eval(join(map(l:digits, {_, d -> d * d}), '+'))
endfunction

echo DigitSquareSum(123)
echo DigitSquareSum(-99)
