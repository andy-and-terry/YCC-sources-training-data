/** Stack-based solution: water is filled layer by layer between bars. */
export function trap(h: readonly number[]): number {
  const stack: number[] = [];
  let water = 0;
  h.forEach((height, i) => {
    while (stack.length && height > h[stack.at(-1)!]) {
      const bottom = stack.pop()!;
      if (!stack.length) break;
      const left = stack.at(-1)!;
      const width = i - left - 1;
      water += width * (Math.min(height, h[left]) - h[bottom]);
    }
    stack.push(i);
  });
  return water;
}

console.log(trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), trap([4, 2, 0, 3, 2, 5]));
