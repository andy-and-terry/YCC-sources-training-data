// Destructuring with defaults, renaming, nesting, and rest collection.
const user = { id: 7, name: "Ada", address: { city: "London", zip: undefined }, tags: ["a", "b", "c"] };

const { name, role = "guest", address: { city, zip = "00000" } } = user;
console.log(name, role, city, zip);

const { id: userId, ...others } = user;
console.log(userId, Object.keys(others));

const [first, , third = "none", fourth = "none"] = user.tags;
console.log(first, third, fourth);

const [head, ...tail] = [1, 2, 3, 4];
console.log(head, tail);

function connect({ host = "localhost", port = 80, secure = false } = {}) {
  return `${secure ? "https" : "http"}://${host}:${port}`;
}
console.log(connect());
console.log(connect({ port: 8080, secure: true }));

let a = 1, b = 2;
[a, b] = [b, a];
console.log(a, b);

for (const [key, value] of Object.entries({ x: 1, y: 2 })) {
  console.log(`${key}=${value}`);
}
