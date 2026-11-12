const s = Symbol("id");
const o = { a: 1, [s]: 2 };
Object.defineProperty(o, "hidden", { value: 3, enumerable: false });
console.log(Object.keys(o));
console.log(Reflect.ownKeys(o));
