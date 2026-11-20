" Wilson's theorem primality test.
function! Wilson(n) abort
  if a:n < 2 | return 0 | endif
  let f = 1
  for i in range(2, a:n - 1)
    let f = (f * i) % a:n
  endfor
  return f == a:n - 1
endfunction
echo filter(range(2, 19), {_, n -> Wilson(n)})
