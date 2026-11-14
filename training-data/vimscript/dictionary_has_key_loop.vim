let d = {'a': 1, 'b': 2}
for [k, v] in items(d)
  echo k . '=' . v
endfor
echo has_key(d, 'z') ? 'yes' : 'no'
echo get(d, 'z', 0)
