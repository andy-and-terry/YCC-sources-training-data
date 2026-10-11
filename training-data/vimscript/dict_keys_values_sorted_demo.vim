" Iterate a dictionary in a stable key order.
let s:ages = {'carol': 41, 'alice': 30, 'bob': 25}
for s:k in sort(keys(s:ages))
  echo printf('%-6s %3d', s:k, s:ages[s:k])
endfor
echo sort(values(s:ages), 'n')
echo has_key(s:ages, 'bob') has_key(s:ages, 'dave')
echo len(s:ages)
call remove(s:ages, 'bob')
echo sort(keys(s:ages))
