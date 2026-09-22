// ES2022 private class fields/methods (#name): true encapsulation
// enforced by the language, not just a naming convention.
class BankAccount {
  #balance;
  static #accountsOpened = 0;

  constructor(owner, openingBalance) {
    this.owner = owner;
    this.#balance = openingBalance;
    BankAccount.#accountsOpened += 1;
  }

  #assertSufficientFunds(amount) {
    if (amount > this.#balance) throw new Error('insufficient funds');
  }

  deposit(amount) {
    this.#balance += amount;
    return this;
  }

  withdraw(amount) {
    this.#assertSufficientFunds(amount);
    this.#balance -= amount;
    return this;
  }

  get balance() {
    return this.#balance;
  }

  static get accountsOpened() {
    return BankAccount.#accountsOpened;
  }
}

const acc = new BankAccount('Alice', 100);
acc.deposit(50).withdraw(30);
console.log(acc.balance);
console.log(BankAccount.accountsOpened);

// #balance is not accessible from outside the class at all (not even as
// undefined) — accessing it throws a SyntaxError at parse time if written
// directly, so it's left out here; JSON.stringify simply ignores it.
console.log(JSON.stringify(acc));

module.exports = { BankAccount };
