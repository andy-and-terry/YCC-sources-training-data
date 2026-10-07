// Array.prototype.sort is stable, so multi-key sorts can chain comparators.
const people = [
  { name: 'Zoe', dept: 'eng', age: 30 },
  { name: 'Al', dept: 'ops', age: 25 },
  { name: 'Bo', dept: 'eng', age: 25 },
  { name: 'Cy', dept: 'ops', age: 30 },
];

const by = (...keys) => (a, b) => {
  for (const k of keys) {
    const [field, dir] = k.startsWith('-') ? [k.slice(1), -1] : [k, 1];
    if (a[field] < b[field]) return -dir;
    if (a[field] > b[field]) return dir;
  }
  return 0;
};

console.log(people.toSorted(by('dept', '-age')).map((p) => p.name));
console.log(people.toSorted(by('age')).map((p) => p.name));
console.log(['b', 'a', 'C'].sort((x, y) => x.localeCompare(y)));
console.log([10, 9, 1].sort());
