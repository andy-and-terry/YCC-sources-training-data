function! Square(n) abort
  return a:n * a:n
endfunction
echo map([1, 2, 3], {_, v -> Square(v)})
let d = {'a': 1, 'b': 2}
for [k, v] in items(d) | echo k . '=' . v | endfor
