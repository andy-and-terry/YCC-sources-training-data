const balances = new WeakMap();

class Account {
  constructor(owner, initialBalance) {
    this.owner = owner;
    balances.set(this, initialBalance);
  }

  deposit(amount) {
    balances.set(this, balances.get(this) + amount);
    return this;
  }

  withdraw(amount) {
    const current = balances.get(this);
    if (amount > current) throw new Error('insufficient funds');
    balances.set(this, current - amount);
    return this;
  }

  get balance() {
    return balances.get(this);
  }
}

const acc = new Account('Alice', 100);
acc.deposit(50).withdraw(30);
console.log(acc.balance);
console.log(JSON.stringify(acc));

module.exports = { Account };
