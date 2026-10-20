function range(a: number, b: number): Iterable<number> {
  return { [Symbol.iterator]() { let i = a; return { next: () => (i < b ? { value: i++, done: false } : { value: undefined, done: true }) }; } };
}
console.log([...range(0, 4)]);
