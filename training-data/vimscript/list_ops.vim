let numbers = range(1, 10)
let doubled = map(copy(numbers), 'v:val * 2')
let evens = filter(copy(numbers), 'v:val % 2 == 0')
let total = 0
for n in numbers
  let total += n
endfor

echo doubled
echo evens
echo total
