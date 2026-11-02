const people = [{ n: "a", t: "x" }, { n: "b", t: "y" }, { n: "c", t: "x" }];
const g = people.reduce((acc, p) => ((acc[p.t] ||= []).push(p.n), acc), {});
console.log(g);
