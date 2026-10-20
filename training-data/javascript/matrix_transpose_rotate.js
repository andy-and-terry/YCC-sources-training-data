const m = [[1, 2, 3], [4, 5, 6]];
const transpose = (a) => a[0].map((_, i) => a.map((r) => r[i]));
const rotate = (a) => transpose(a).map((r) => r.reverse());
console.log(transpose(m));
console.log(rotate(m));
