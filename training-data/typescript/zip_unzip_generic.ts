const zip = <A, B>(a: A[], b: B[]): [A, B][] => a.slice(0, Math.min(a.length, b.length)).map((x, i) => [x, b[i]]);
const unzip = <A, B>(p: [A, B][]): [A[], B[]] => [p.map((x) => x[0]), p.map((x) => x[1])];
console.log(unzip(zip([1, 2, 3], ["a", "b"])));
