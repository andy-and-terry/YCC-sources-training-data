let nums = [10, 20, 30, 40, 50, 60]

echo nums[1:3]
echo nums[:2]
echo nums[-2:]
echo nums[2:]
echo nums[-1]
echo get(nums, 10, 'none')
echo len(nums[7:])

let copy = copy(nums)
call remove(copy, 0, 1)
echo copy
echo nums

call insert(copy, 99)
call insert(copy, 77, 2)
echo copy
echo reverse(copy[:])
echo index(nums, 40)
echo range(0, 10, 5)
echo repeat([0], 3) + [1]
