let d = {'a': 1, 'b': 2}
for [k, v] in items(d)
  echo k . '=' . v
endfor
echo has_key(d, 'a') get(d, 'z', 0)
echo keys(d)
