const defaults = { theme: "light", size: 12, nested: { a: 1 } };
const overrides = { size: 14, extra: true };

const merged = { ...defaults, ...overrides };
const assigned = Object.assign({}, defaults, overrides);
console.log(merged, assigned);

console.log("shallow:", merged.nested === defaults.nested);

const target = { set x(v) { console.log("setter called", v); } };
Object.assign(target, { x: 1 });
const copy = { ...target };
console.log(Object.getOwnPropertyDescriptor(copy, "x"));

const { size, ...rest } = merged;
console.log(size, rest);
