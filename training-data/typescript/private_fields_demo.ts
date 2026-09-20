class BankAccount {
  #balance: number;
  static #accountsOpened = 0;

  constructor(openingBalance: number) {
    this.#balance = openingBalance;
    BankAccount.#accountsOpened++;
  }

  deposit(amount: number): void {
    this.#balance += amount;
  }

  #assertSufficientFunds(amount: number): void {
    if (amount > this.#balance) {
      throw new Error("insufficient funds");
    }
  }

  withdraw(amount: number): void {
    this.#assertSufficientFunds(amount);
    this.#balance -= amount;
  }

  get balance(): number {
    return this.#balance;
  }

  static get accountsOpened(): number {
    return BankAccount.#accountsOpened;
  }

  hasSameBalanceAs(other: BankAccount): boolean {
    // true native encapsulation: #balance is inaccessible from outside the
    // class, but another instance of the SAME class can still read it here.
    return this.#balance === other.#balance;
  }
}

const account = new BankAccount(100);
account.deposit(50);
account.withdraw(30);
console.log(account.balance);

const other = new BankAccount(120);
console.log(account.hasSameBalanceAs(other));
console.log(BankAccount.accountsOpened);

try {
  account.withdraw(10_000);
} catch (err) {
  console.log((err as Error).message);
}
