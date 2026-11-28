def singleNumber(List<Integer> nums) {
    nums.inject(0) { acc, n -> acc ^ n }
}

println singleNumber([4, 1, 2, 1, 2]) // 4
