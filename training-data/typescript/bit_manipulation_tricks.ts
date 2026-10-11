const isPowerOfTwo = (n: number): boolean => n > 0 && (n & (n - 1)) === 0;
const lowestSetBit = (n: number): number => n & -n;
const clearLowestSetBit = (n: number): number => n & (n - 1);
const toggleBit = (n: number, i: number): number => n ^ (1 << i);
const isBitSet = (n: number, i: number): boolean => ((n >> i) & 1) === 1;

function countBits(n: number): number {
  let c = 0;
  while (n !== 0) {
    n = clearLowestSetBit(n);
    c++;
  }
  return c;
}

function singleNumber(nums: number[]): number {
  return nums.reduce((acc, x) => acc ^ x, 0);
}

console.log(isPowerOfTwo(64), isPowerOfTwo(70));
console.log(lowestSetBit(0b101000));
console.log(countBits(0b1011011));
console.log(toggleBit(0b1000, 1).toString(2));
console.log(isBitSet(5, 2), isBitSet(5, 1));
console.log(singleNumber([4, 1, 2, 1, 2]));
