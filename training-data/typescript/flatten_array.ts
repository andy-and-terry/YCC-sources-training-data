type Nested<T> = T | Nested<T>[];

function flatten<T>(items: Nested<T>[]): T[] {
  return items.reduce<T[]>((acc, item) => {
    return acc.concat(Array.isArray(item) ? flatten(item) : (item as T));
  }, []);
}

console.log(flatten([1, [2, 3, [4, [5, 6]], 7]]));
