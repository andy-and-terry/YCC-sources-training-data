// Destructuring with defaults, renaming, nested patterns, rest and swaps.
const user = { name: 'Ada', address: { city: 'London', zip: 'N1' }, tags: ['a', 'b', 'c'] };

const { name, age = 30, address: { city }, tags: [first, ...others] } = user;
console.log(name, age, city, first, others);

const { name: fullName, ...rest } = user;
console.log(fullName, Object.keys(rest));

function connect({ host = 'localhost', port = 80, secure = false } = {}) {
  return `${secure ? 'https' : 'http'}://${host}:${port}`;
}
console.log(connect());
console.log(connect({ port: 8080, secure: true }));

let a = 1, b = 2;
[a, b] = [b, a];
console.log(a, b);

const [x, , z = 'dflt'] = [10, 20];
console.log(x, z);

for (const [k, v] of Object.entries({ p: 1, q: 2 })) console.log(k, v);
