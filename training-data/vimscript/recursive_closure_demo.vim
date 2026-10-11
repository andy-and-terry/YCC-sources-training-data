" A Funcref calling itself through a dict, since lambdas cannot self-reference.
let s:fact = {}
function! s:fact.call(n) abort
  return a:n <= 1 ? 1 : a:n * self.call(a:n - 1)
endfunction
echo map(range(1, 6), {_, v -> s:fact.call(v)})

let s:Add = {x -> {y -> x + y}}
let s:Add5 = s:Add(5)
echo s:Add5(10)
