function plain<T extends readonly unknown[]>(items: T): T {
  return items;
}

function literal<const T extends readonly unknown[]>(items: T): T {
  return items;
}

const a = plain(["x", "y"]);
const b = literal(["x", "y"]);

// a: string[]            b: readonly ["x", "y"]
type B = typeof b;
const first: B[0] = "x";

function route<const T extends { path: string; methods: readonly string[] }>(config: T): T {
  return config;
}

const r = route({ path: "/users", methods: ["GET", "POST"] });
type Method = (typeof r.methods)[number];
const m: Method = "POST";

console.log(a, b, first, r.path, m);
