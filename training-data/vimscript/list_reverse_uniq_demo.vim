" reverse() works in place; uniq() removes adjacent duplicates only.
let s:a = [1, 2, 3, 4]
echo reverse(copy(s:a))
echo s:a
let s:dups = [1, 1, 2, 2, 2, 3, 1, 1]
echo uniq(copy(s:dups))
echo uniq(sort(copy(s:dups), 'n'))
let s:words = ['b', 'a', 'B', 'a']
echo uniq(sort(copy(s:words), 'i'), 'i')
