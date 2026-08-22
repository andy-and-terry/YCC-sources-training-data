function removeDuplicatesOrdered<T>(items: T[]): T[] {
  return [...new Set(items)];
}

console.log(removeDuplicatesOrdered([1, 2, 2, 3, 1, 4]));
