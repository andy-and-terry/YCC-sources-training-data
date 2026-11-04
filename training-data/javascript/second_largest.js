function secondLargest(xs) {
  let first = -Infinity, second = -Infinity;
  for (const x of xs) {
    if (x > first) [first, second] = [x, first];
    else if (x < first && x > second) second = x;
  }
  return Number.isFinite(second) ? second : undefined;
}

console.log(secondLargest([4, 9, 2, 9, 7])); // 7
console.log(secondLargest([3, 3])); // undefined
