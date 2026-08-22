function permutations<T>(items: T[]): T[][] {
  if (items.length <= 1) return [items];
  const result: T[][] = [];
  for (let i = 0; i < items.length; i++) {
    const rest = [...items.slice(0, i), ...items.slice(i + 1)];
    for (const perm of permutations(rest)) {
      result.push([items[i], ...perm]);
    }
  }
  return result;
}

function combinations<T>(items: T[], r: number): T[][] {
  if (r === 0) return [[]];
  if (items.length < r) return [];
  const [first, ...rest] = items;
  const withFirst = combinations(rest, r - 1).map((c) => [first, ...c]);
  const withoutFirst = combinations(rest, r);
  return [...withFirst, ...withoutFirst];
}

console.log(permutations([1, 2, 3]));
console.log(combinations([1, 2, 3, 4], 2));
