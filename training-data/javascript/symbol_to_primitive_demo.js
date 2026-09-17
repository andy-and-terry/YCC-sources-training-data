class Money {
  constructor(cents) {
    this.cents = cents;
  }

  [Symbol.toPrimitive](hint) {
    if (hint === 'number') return this.cents / 100;
    if (hint === 'string') return `$${(this.cents / 100).toFixed(2)}`;
    return `Money(${this.cents})`;
  }
}

const price = new Money(1999);
console.log(`${price}`);
console.log(price + 0);
console.log(price * 2);
console.log(price);

module.exports = { Money };
