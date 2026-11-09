const people = [{ n: 'a', g: 1 }, { n: 'b', g: 2 }, { n: 'c', g: 1 }];
const grouped = people.reduce((acc, p) => {
  (acc[p.g] ||= []).push(p.n);
  return acc;
}, {});
console.log(grouped);
