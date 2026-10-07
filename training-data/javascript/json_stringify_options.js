const data = {
  name: "Widget",
  price: 9.5,
  created: new Date(Date.UTC(2024, 0, 15)),
  secret: "hidden",
  tags: new Set(["a", "b"]),
};

const text = JSON.stringify(
  data,
  (key, value) => {
    if (key === "secret") return undefined;
    if (value instanceof Set) return [...value];
    return value;
  },
  2
);
console.log(text);

const parsed = JSON.parse(text, (key, value) =>
  key === "created" ? new Date(value) : value
);
console.log(parsed.created.getUTCFullYear());

class Money {
  constructor(amount) { this.amount = amount; }
  toJSON() { return `$${this.amount.toFixed(2)}`; }
}
console.log(JSON.stringify({ total: new Money(12.5) }));
