let [a, b, c] = [1, 2, 3]
echo a . ' ' . b . ' ' . c

let [first; rest] = [10, 20, 30, 40]
echo first
echo rest

let [x, y] = [1, 2]
let [x, y] = [y, x]
echo x . ' ' . y

let [name, age] = split('Ann:31', ':')
echo name . ' is ' . age

let [q, r] = [17 / 5, 17 % 5]
echo q . ' r ' . r

let pairs = [['a', 1], ['b', 2], ['c', 3]]
for [letter, number] in pairs
  echo letter . number
endfor

let [head; tail] = split('/usr/local/bin', '/')
echo head
echo tail

let nested = [1, [2, 3]]
let [one, inner] = nested
let [two, three] = inner
echo one + two + three

let numbers = [5, 3, 8, 1]
let [lo, hi] = [min(numbers), max(numbers)]
echo lo . '..' . hi
echo numbers[0] . ' ' . numbers[-1]
echo numbers[1:2]
echo numbers[1:]
echo get(numbers, 10, 'none')

try
  let [p, q, r] = [1, 2]
catch /E688/
  echo 'too few items to unpack'
endtry

echo extend([1, 2], [3, 4])
echo extend([1, 2], [9], 1)
echo insert([2, 3], 1)
echo remove([1, 2, 3], 0)
echo count([1, 2, 1, 1], 1)
echo index(['a', 'b'], 'b')
echo flatten([1, [2, [3]]])
