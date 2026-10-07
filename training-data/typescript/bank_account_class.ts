type Txn = { kind: "deposit" | "withdraw"; amount: number; at: Date };

export class BankAccount {
  private balanceCents = 0;
  private readonly txns: Txn[] = [];
  private open = true;

  get balance(): number { this.ensureOpen(); return this.balanceCents / 100; }

  deposit(amount: number): void {
    this.ensureOpen();
    if (amount <= 0) throw new RangeError("amount must be positive");
    this.balanceCents += Math.round(amount * 100);
    this.txns.push({ kind: "deposit", amount, at: new Date() });
  }

  withdraw(amount: number): void {
    this.ensureOpen();
    const cents = Math.round(amount * 100);
    if (cents > this.balanceCents) throw new Error("insufficient funds");
    this.balanceCents -= cents;
    this.txns.push({ kind: "withdraw", amount, at: new Date() });
  }

  close(): void { this.open = false; }

  private ensureOpen(): void { if (!this.open) throw new Error("account closed"); }
}

const a = new BankAccount();
a.deposit(10.1);
a.deposit(0.2);
a.withdraw(5);
console.log(a.balance);
