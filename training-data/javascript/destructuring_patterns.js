const user = { id: 7, name: 'Ann', address: { city: 'Oslo', zip: '0150' }, tags: ['a', 'b', 'c'] };

const { name, address: { city }, missing = 'n/a', ...rest } = user;
console.log(name, city, missing, Object.keys(rest));

const [first, , third = 'x', ...others] = user.tags;
console.log(first, third, others);

function connect({ host = 'localhost', port = 80 } = {}) {
  return `${host}:${port}`;
}
console.log(connect(), connect({ port: 8080 }));

let a = 1, b = 2;
[a, b] = [b, a];
console.log(a, b);

for (const [k, v] of Object.entries({ x: 1, y: 2 })) console.log(k, v);
