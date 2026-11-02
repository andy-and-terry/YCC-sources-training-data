let s:items = {'a': 1, 'b': 2}
for [k, v] in items(s:items)
  echo k . '=' . v
endfor
echo map([1, 2, 3], {_, x -> x * x})
