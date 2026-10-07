// Reflect mirrors the object-operation traps and returns booleans instead of
// throwing, which makes it handy for metaprogramming.
const o = { a: 1 };
console.log(Reflect.has(o, 'a'), Reflect.ownKeys(o));
console.log(Reflect.set(o, 'b', 2), o);
console.log(Reflect.deleteProperty(o, 'a'), o);
console.log(Reflect.getPrototypeOf(o) === Object.prototype);

const frozen = Object.freeze({ k: 1 });
console.log(Reflect.set(frozen, 'k', 2));
console.log(Reflect.defineProperty(frozen, 'z', { value: 1 }));

function Person(name) { this.name = name; }
console.log(Reflect.construct(Person, ['Ann']).name);
console.log(Reflect.apply(Math.max, null, [3, 9, 4]));

const logged = new Proxy({ x: 1 }, {
  get(target, key, receiver) {
    console.log('get', String(key));
    return Reflect.get(target, key, receiver);
  },
});
console.log(logged.x);
