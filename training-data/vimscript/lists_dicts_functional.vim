let nums = [5, 3, 8, 1, 9, 2]
echo sort(copy(nums), 'n')
echo map(copy(nums), 'v:val * 2')
echo filter(copy(nums), {_, v -> v % 2 == 1})
echo reduce(nums, {acc, v -> acc + v}, 0)
echo join(map(range(1, 5), 'string(v:val * v:val)'), ',')
echo reverse(copy(nums))[0:2]
echo index(nums, 8) . ' ' . count(nums, 3) . ' ' . len(nums) . ' ' . max(nums) . ' ' . min(nums)
echo uniq(sort([3, 1, 3, 2, 1]))
echo extend([1, 2], [3], 1)
echo add(copy(nums), 7)[-1]
echo remove(copy(nums), 0, 1)
echo get(nums, 10, 'none') . ' ' . nums[-1] . ' ' . string(nums[1:3])
let d = {'a': 1, 'b': 2}
let d.c = 3
echo keys(d) sort(values(d)) has_key(d, 'a') get(d, 'z', 0)
echo map(copy(d), {k, v -> v * 10})
echo filter(copy(d), {k, v -> v > 1})
echo items(d)
echo empty([]) . empty({}) . empty('') . empty(0)
echo type(1) type('s') type([]) type({}) type(1.5)
