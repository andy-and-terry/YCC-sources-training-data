// JSON.stringify replacer/toJSON and JSON.parse reviver for custom types.
class Money {
  constructor(cents) { this.cents = cents; }
  toJSON() { return { $money: this.cents }; }
}

const data = { id: 1, price: new Money(1999), when: new Date(Date.UTC(2024, 0, 1)), secret: 'x', skip: undefined };
const json = JSON.stringify(data, (k, v) => (k === 'secret' ? undefined : v));
console.log(json);

const revived = JSON.parse(json, (k, v) => {
  if (v && typeof v === 'object' && '$money' in v) return new Money(v.$money);
  if (k === 'when') return new Date(v);
  return v;
});
console.log(revived.price instanceof Money, revived.when.getUTCFullYear());

console.log(JSON.stringify({ a: 1, b: [1, 2], c: { d: 1 } }, null, 2));
console.log(JSON.stringify({ a: 1, b: 2, c: 3 }, ['a', 'c']));
console.log(JSON.stringify([NaN, Infinity, () => 1, undefined]));
