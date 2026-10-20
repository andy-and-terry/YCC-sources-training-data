function pluck<T, K extends keyof T>(items: T[], key: K): T[K][] {
  return items.map((i) => i[key]);
}

const people = [
  { name: "Ada", age: 36 },
  { name: "Linus", age: 54 },
];

const names: string[] = pluck(people, "name");
const ages: number[] = pluck(people, "age");
console.log(names, ages);
