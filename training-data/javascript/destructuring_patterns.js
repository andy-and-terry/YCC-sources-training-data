const user = { id: 7, name: "Ada", address: { city: "London", zip: "N1" }, tags: ["a", "b", "c"] };

const { name, address: { city }, role = "guest", ...rest } = user;
console.log(name, city, role, Object.keys(rest));

const [first, , third = "none", ...others] = user.tags;
console.log(first, third, others);

let a = 1, b = 2;
[a, b] = [b, a];
console.log(a, b);

function connect({ host = "localhost", port = 80 } = {}) {
  return `${host}:${port}`;
}
console.log(connect(), connect({ port: 8080 }));

for (const [k, v] of Object.entries({ x: 1, y: 2 })) console.log(k, v);
