const words = ['Zebra', 'apple', 'Äpfel', 'banana', 'Apple', 'cherry'];

console.log([...words].sort());
console.log([...words].sort((a, b) => a.localeCompare(b)));
console.log([...words].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' })));

const files = ['file10.txt', 'file2.txt', 'file1.txt', 'file20.txt'];
console.log([...files].sort());
console.log([...files].sort(new Intl.Collator(undefined, { numeric: true }).compare));

const people = [
  { name: 'Bob', age: 30 },
  { name: 'Alice', age: 30 },
  { name: 'Carol', age: 25 },
];
const sorted = people.toSorted((a, b) => b.age - a.age || a.name.localeCompare(b.name));
console.log(sorted.map((p) => `${p.name}(${p.age})`).join(' '));
console.log(people[0].name);

console.log([10, 9, 1, 100].sort());
console.log([10, 9, 1, 100].sort((a, b) => a - b));
console.log([3, 1, 2].toReversed(), [1, 2, 3].with(1, 99));
