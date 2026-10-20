const sym = Symbol("id");
const o = { b: 1, a: 2, [sym]: 3 };
Object.defineProperty(o, "hidden", { value: 4, enumerable: false });
console.log(Reflect.ownKeys(o));
console.log(Object.keys(o));
