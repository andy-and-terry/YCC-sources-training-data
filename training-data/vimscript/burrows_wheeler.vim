let s = 'banana$'
let n = len(s)
let rots = map(range(n), {_, i -> s[i :] . s[: i - 1]})
call sort(rots)
echo join(map(rots, {_, r -> r[-1:]}), '')
