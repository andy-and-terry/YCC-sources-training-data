let d = {'a': 1, 'b': 2}
let d.c = 3
for [k, v] in items(d)
  echo k . '=' . v
endfor
echo has_key(d, 'z') get(d, 'z', -1) keys(d)
call remove(d, 'a')
echo len(d)
