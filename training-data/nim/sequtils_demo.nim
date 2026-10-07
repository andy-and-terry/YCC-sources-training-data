import sequtils

let nums = @[1, 2, 3, 4, 5, 6, 7, 8]
echo nums.filterIt(it mod 2 == 0)
echo nums.mapIt(it * it)
echo nums.foldl(a + b)
echo nums.anyIt(it > 7), " ", nums.allIt(it > 0)
echo zip(nums, nums.mapIt($it & "!"))[0..2]
echo deduplicate(@[1, 1, 2, 3, 3, 3])
echo nums.distribute(3)
echo toSeq(1..5).concat(@[10, 20])
