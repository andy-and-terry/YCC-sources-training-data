type TxKind = "deposit" | "withdraw" | "transfer-in" | "transfer-out";
interface Tx { kind: TxKind; cents: number; balance: number }

export class InsufficientFunds extends Error {
  constructor(readonly owner: string, readonly balance: number, readonly requested: number) {
    super(`${owner}: balance ${balance}, requested ${requested}`);
    this.name = "InsufficientFunds";
  }
}

export class Account {
  private _balance = 0;
  readonly history: Tx[] = [];
  constructor(readonly owner: string, private readonly overdraft = 0) {}

  get balance(): number {
    return this._balance;
  }

  apply(kind: TxKind, cents: number): void {
    if (!Number.isInteger(cents) || cents <= 0) throw new RangeError("amount must be a positive integer");
    const delta = kind === "deposit" || kind === "transfer-in" ? cents : -cents;
    if (this._balance + delta < -this.overdraft) throw new InsufficientFunds(this.owner, this._balance, cents);
    this._balance += delta;
    this.history.push({ kind, cents, balance: this._balance });
  }
}

export class Bank {
  private accounts = new Map<string, Account>();
  open(owner: string, overdraft = 0): Account {
    const a = new Account(owner, overdraft);
    this.accounts.set(owner, a);
    return a;
  }
  transfer(from: string, to: string, cents: number): void {
    const a = this.accounts.get(from), b = this.accounts.get(to);
    if (!a || !b) throw new Error("unknown account");
    a.apply("transfer-out", cents);
    b.apply("transfer-in", cents);
  }
  report(): string[] {
    return [...this.accounts.values()].map((a) => `${a.owner}: ${(a.balance / 100).toFixed(2)} (${a.history.length} tx)`);
  }
}

const bank = new Bank();
bank.open("alice").apply("deposit", 10_000);
bank.open("bob", 1_000).apply("deposit", 500);
bank.transfer("alice", "bob", 2_500);
bank.transfer("bob", "alice", 3_500); // uses overdraft
try {
  bank.transfer("bob", "alice", 1_000);
} catch (e) {
  if (e instanceof InsufficientFunds) console.log("rejected:", e.message);
}
console.log(bank.report());
