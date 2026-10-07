// Object.defineProperty, getters/setters, and freezing.
const account = { _balance: 0 };
Object.defineProperty(account, 'balance', {
  get() { return this._balance; },
  set(v) {
    if (v < 0) throw new RangeError('negative balance');
    this._balance = v;
  },
  enumerable: true,
});
account.balance = 50;
console.log(account.balance);
try { account.balance = -1; } catch (e) { console.log(e.message); }

const point = {};
Object.defineProperty(point, 'x', { value: 1, writable: false, enumerable: false });
point.x = 5;
console.log(point.x, Object.keys(point), Object.getOwnPropertyDescriptor(point, 'x'));

const frozen = Object.freeze({ a: 1, nested: { b: 2 } });
frozen.a = 99;
frozen.nested.b = 3;
console.log(frozen, Object.isFrozen(frozen), Object.isFrozen(frozen.nested));

class Temp {
  #c = 0;
  get f() { return this.#c * 9 / 5 + 32; }
  set f(v) { this.#c = (v - 32) * 5 / 9; }
}
const t = new Temp();
t.f = 212;
console.log(t.f);
