function powerSet<T>(items: T[]): T[][] {
  return items.reduce<T[][]>(
    (subsets, item) => subsets.concat(subsets.map((set) => [...set, item])),
    [[]]
  );
}

console.log(powerSet([1, 2, 3]));
