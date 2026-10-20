const secrets = new WeakMap();

class Account {
  constructor(balance) {
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

const acct = new Account(10).deposit(5);
console.log(acct.balance, Object.keys(acct));
