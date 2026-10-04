const user = {
  id: 7,
  name: 'Ada',
  address: { city: 'London', zip: 'N1' },
  tags: ['admin', 'dev', 'ops'],
};

const { name, address: { city }, role = 'guest', ...rest } = user;
console.log(name, city, role);
console.log(Object.keys(rest));

const [first, , third = 'none', ...others] = user.tags;
console.log(first, third, others);

let a = 1;
let b = 2;
[a, b] = [b, a];
console.log(a, b);

function connect({ host = 'localhost', port = 80, secure = false } = {}) {
  return `${secure ? 'https' : 'http'}://${host}:${port}`;
}
console.log(connect());
console.log(connect({ host: 'example.com', secure: true }));

const key = 'dynamic';
const { [key]: value = 'fallback' } = { dynamic: 99 };
console.log(value);

for (const [k, v] of Object.entries({ x: 1, y: 2 })) {
  console.log(`${k}=${v}`);
}
