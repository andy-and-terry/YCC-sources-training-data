const account = {};
let balance = 0;

Object.defineProperty(account, 'balance', {
  get() {
    return balance;
  },
  set(v) {
    if (typeof v !== 'number' || v < 0) throw new RangeError('invalid balance');
    balance = v;
  },
  enumerable: true,
});

Object.defineProperty(account, 'id', {
  value: 'ACC-001',
  writable: false,
  enumerable: false,
});

account.balance = 50;
console.log(account.balance);
console.log(Object.keys(account));
console.log(account.id);

account.id = 'changed';
console.log(account.id);

try {
  account.balance = -5;
} catch (e) {
  console.log(e.name, e.message);
}

console.log(Object.getOwnPropertyDescriptor(account, 'id'));

const frozen = Object.freeze({ a: 1, nested: { b: 2 } });
frozen.nested.b = 3;
console.log(Object.isFrozen(frozen), frozen.nested.b);
