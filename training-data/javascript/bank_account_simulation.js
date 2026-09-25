class InsufficientFundsError extends Error {}

class Account {
  #balance = 0;
  history = [];
  constructor(owner) {
    this.owner = owner;
  }
  get balance() {
    return this.#balance;
  }
  deposit(cents) {
    if (cents <= 0) throw new RangeError("deposit must be positive");
    this.#balance += cents;
    this.history.push({ type: "deposit", cents, balance: this.#balance });
  }
  withdraw(cents) {
    if (cents > this.#balance) throw new InsufficientFundsError(`${this.owner}: balance ${this.#balance}, requested ${cents}`);
    this.#balance -= cents;
    this.history.push({ type: "withdraw", cents, balance: this.#balance });
  }
}

class Bank {
  accounts = new Map();
  open(owner, initial = 0) {
    const a = new Account(owner);
    if (initial) a.deposit(initial);
    this.accounts.set(owner, a);
    return a;
  }
  transfer(from, to, cents) {
    this.accounts.get(from).withdraw(cents);
    this.accounts.get(to).deposit(cents);
  }
}

const bank = new Bank();
bank.open("alice", 10000);
bank.open("bob", 500);
bank.transfer("alice", "bob", 2500);
try {
  bank.transfer("bob", "alice", 99999);
} catch (e) {
  if (e instanceof InsufficientFundsError) console.log("error:", e.message);
}
for (const [name, a] of bank.accounts) console.log(name, (a.balance / 100).toFixed(2), a.history.length, "tx");
module.exports = { Bank, Account };
