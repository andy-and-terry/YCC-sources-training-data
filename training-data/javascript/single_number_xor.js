const singleNumber = (nums) => nums.reduce((acc, n) => acc ^ n, 0);

console.log(singleNumber([4, 1, 2, 1, 2])); // 4
