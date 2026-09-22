interface AccountState {
  balance: number;
  pin: string;
}

const privateState = new WeakMap<BankAccount, AccountState>();

class BankAccount {
  constructor(owner: string, pin: string) {
    this.owner = owner;
    privateState.set(this, { balance: 0, pin });
  }

  readonly owner: string;

  deposit(amount: number): void {
    const state = privateState.get(this)!;
    state.balance += amount;
  }

  withdraw(amount: number, pin: string): boolean {
    const state = privateState.get(this)!;
    if (pin !== state.pin || amount > state.balance) {
      return false;
    }
    state.balance -= amount;
    return true;
  }

  get balance(): number {
    return privateState.get(this)!.balance;
  }
}

const acct = new BankAccount("Ada", "1234");
acct.deposit(100);
console.log(acct.withdraw(30, "wrong"));
console.log(acct.withdraw(30, "1234"));
console.log(acct.balance);

// privateState has no entry once an account is garbage collected, so it
// never leaks account state the way a plain instance field map keyed by
// id would.
const registry = new WeakSet<BankAccount>();
registry.add(acct);
console.log(registry.has(acct));
