// WeakMap-backed private state: entries vanish when the instance is garbage collected.
const secrets = new WeakMap();

class Account {
  constructor(owner, balance) {
    this.owner = owner;
    secrets.set(this, { balance });
  }
  deposit(n) {
    secrets.get(this).balance += n;
    return this;
  }
  get balance() {
    return secrets.get(this).balance;
  }
}

const acct = new Account("ada", 10).deposit(5);
console.log(acct.balance, Object.keys(acct));
