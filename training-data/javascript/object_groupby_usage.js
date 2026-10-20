const people = [{ n: "a", age: 20 }, { n: "b", age: 30 }, { n: "c", age: 20 }];
const byAge = Object.groupBy(people, (p) => p.age);
console.log(byAge);
