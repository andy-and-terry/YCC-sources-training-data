let original = {'name': 'cfg', 'items': [1, 2, 3]}

let alias = original
let shallow = copy(original)
let deep = deepcopy(original)

call add(original.items, 4)
let original.name = 'changed'

echo 'alias:   ' . string(alias)
echo 'shallow: ' . string(shallow)
echo 'deep:    ' . string(deep)

echo original is alias
echo original is shallow
echo original.items is shallow.items
echo original.items is deep.items
echo original == deep
echo original == alias

let a = [1, [2, 3]]
let b = copy(a)
let c = deepcopy(a)
let a[1][0] = 99
echo b[1][0] . ' ' . c[1][0]

let x = [1, 2, 3]
let y = x
let y += [4]
echo x
let z = x + []
call add(z, 5)
echo string(x) . ' ' . string(z)

let l = [1, 2]
let l2 = l
let l = l + [3]
echo string(l) . ' ' . string(l2)
echo islocked('l')
lockvar l
try
  call add(l, 9)
catch /E741/
  echo 'locked list rejected add'
endtry
unlockvar l
