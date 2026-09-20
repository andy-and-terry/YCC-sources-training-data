class BankAccount {
  #balance;
  static #accountsOpened = 0;

  static {
    BankAccount.#accountsOpened = 0;
  }

  constructor(owner, openingBalance = 0) {
    this.owner = owner;
    this.#balance = openingBalance;
    BankAccount.#accountsOpened++;
  }

  #assertPositive(amount) {
    if (amount <= 0) throw new Error('amount must be positive');
  }

  deposit(amount) {
    this.#assertPositive(amount);
    this.#balance += amount;
    return this;
  }

  withdraw(amount) {
    this.#assertPositive(amount);
    if (amount > this.#balance) throw new Error('insufficient funds');
    this.#balance -= amount;
    return this;
  }

  get balance() {
    return this.#balance;
  }

  static get accountsOpened() {
    return BankAccount.#accountsOpened;
  }

  static isAccount(obj) {
    return #balance in obj;
  }
}

const acc = new BankAccount('Alice', 100);
acc.deposit(50).withdraw(30);
console.log(acc.balance);
console.log(BankAccount.accountsOpened);
console.log(BankAccount.isAccount(acc));
console.log(BankAccount.isAccount({}));

module.exports = { BankAccount };
