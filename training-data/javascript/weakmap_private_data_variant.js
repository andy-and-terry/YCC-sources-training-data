const secrets = new WeakMap();

class Account {
  constructor(pin) {
    secrets.set(this, { pin });
  }
  check(pin) {
    return secrets.get(this).pin === pin;
  }
}

const a = new Account("1234");
console.log(a.check("1234"), a.check("0000"));
