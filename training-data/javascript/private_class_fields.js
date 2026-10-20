class Account {
  #balance = 0;
  static #count = 0;
  constructor() { Account.#count++; }
  deposit(n) { this.#balance += n; return this; }
  get balance() { return this.#balance; }
  static get count() { return Account.#count; }
  #secret() { return "s"; }
  hasSecret() { return #balance in this; }
}
const a = new Account().deposit(50);
console.log(a.balance, Account.count, a.hasSecret());
