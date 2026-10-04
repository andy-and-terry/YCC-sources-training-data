let nums = range(1, 10)
echo nums[2:4]
echo nums[-3:]
echo nums[:2]
echo reverse(copy(nums))[0:2]

let nums[0:1] = [100, 200]
echo nums

call remove(nums, 0, 1)
echo nums
call insert(nums, 0)
echo nums
echo get(nums, 50, 'none')
echo len(nums) . ' items'
echo index(nums, 5)
echo count(nums, 5)
