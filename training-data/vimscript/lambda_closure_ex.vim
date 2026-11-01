function! MakeAdder(n)
  return {x -> x + a:n}
endfunction
let add5 = MakeAdder(5)
echo add5(10)
echo map([1, 2, 3], {_, v -> v * 2})
echo reduce([1, 2, 3, 4], {a, b -> a + b}, 0)
