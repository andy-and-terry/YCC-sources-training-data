function! Add(a, b) abort
  return a:a + a:b
endfunction
let F = function('Add', [10])
echo F(5)
let Sq = {x -> x * x}
echo Sq(7)
echo call('Add', [1, 2])
