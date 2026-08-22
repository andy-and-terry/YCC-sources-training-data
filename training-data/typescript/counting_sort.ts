function countingSort(items: number[]): number[] {
  if (items.length === 0) return [];
  const max = Math.max(...items);
  const counts = new Array(max + 1).fill(0);
  for (const x of items) counts[x]++;
  const result: number[] = [];
  counts.forEach((count: number, value: number) => {
    for (let i = 0; i < count; i++) result.push(value);
  });
  return result;
}

console.log(countingSort([5, 3, 8, 1, 9, 2, 3]));
