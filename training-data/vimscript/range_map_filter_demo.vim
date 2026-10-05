let nums = range(1, 10)
echo nums
echo range(0, 20, 5)
echo range(5, 1, -2)

echo map(copy(nums), 'v:val * v:val')
echo filter(copy(nums), 'v:val % 2 == 0')
echo map(copy(nums), {_, v -> v * 10})
echo filter(copy(nums), {_, v -> v > 7})

" map() and filter() modify the list in place, so copy() first.
let words = ['apple', 'Banana', 'cherry']
echo map(copy(words), 'toupper(v:val)')
echo filter(copy(words), 'v:val =~# "^[a-z]"')

let total = 0
for n in nums
  let total += n
endfor
echo total
