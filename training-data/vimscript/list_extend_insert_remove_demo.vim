" Mutating list functions: add, insert, extend, remove.
let s:l = [1, 2, 3]
call add(s:l, 4)
call insert(s:l, 0)
call insert(s:l, 99, 3)
echo s:l
call extend(s:l, [7, 8])
call extend(s:l, [-1], 0)
echo s:l
let s:removed = remove(s:l, 1)
echo s:removed s:l
let s:chunk = remove(s:l, 0, 2)
echo s:chunk s:l
echo index(s:l, 8)
