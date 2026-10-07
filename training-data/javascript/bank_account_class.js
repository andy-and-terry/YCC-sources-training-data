class InsufficientFundsError extends Error {}

class BankAccount {
  #balance = 0;
  #history = [];

  get balance() { return this.#balance; }
  get history() { return [...this.#history]; }

  deposit(amount) {
    if (amount <= 0) throw new RangeError("amount must be positive");
    this.#balance += amount;
    this.#history.push({ type: "deposit", amount });
  }

  withdraw(amount) {
    if (amount > this.#balance) throw new InsufficientFundsError(`cannot withdraw ${amount}`);
    this.#balance -= amount;
    this.#history.push({ type: "withdraw", amount });
  }
}

const acct = new BankAccount();
acct.deposit(100);
acct.withdraw(30);
try { acct.withdraw(500); } catch (e) { console.log(e.constructor.name, e.message); }
console.log(acct.balance, acct.history);
