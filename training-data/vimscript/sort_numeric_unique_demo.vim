let nums = [10, 9, 2, 33, 4, 4, 100, 9]

echo sort(copy(nums))
echo sort(copy(nums), 'n')
echo sort(copy(nums), {a, b -> b - a})
echo uniq(sort(copy(nums), 'n'))

let words = ['banana', 'Apple', 'cherry', 'apple']
echo sort(copy(words))
echo sort(copy(words), 'i')
echo sort(copy(words), {a, b -> len(a) - len(b)})

let people = [{'n': 'Zed', 'a': 31}, {'n': 'Amy', 'a': 27}, {'n': 'Bob', 'a': 31}]
echo map(sort(copy(people), {x, y -> x.a == y.a ? (x.n > y.n ? 1 : -1) : x.a - y.a}), 'v:val.n')

echo max(nums) min(nums)
echo sort(keys({'b': 1, 'a': 2, 'c': 3}))
