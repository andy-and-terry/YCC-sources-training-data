class Money {
  constructor(c) { this.cents = c; }
  [Symbol.toPrimitive](hint) { return hint === "string" ? `$${(this.cents / 100).toFixed(2)}` : this.cents; }
}
const m = new Money(1999);
console.log(`${m}`, m + 1, m > 1000);
