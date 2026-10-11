const rows = [
  ["Widget", 4, 3.5],
  ["Gadget", 12, 10],
  ["Thingamajig", 1, 100.25],
];

console.log("Item".padEnd(14) + "Qty".padStart(5) + "Price".padStart(10));
console.log("-".repeat(29));
for (const [name, qty, price] of rows) {
  console.log(name.padEnd(14) + String(qty).padStart(5) + price.toFixed(2).padStart(10));
}

const mask = (card) => card.slice(-4).padStart(card.length, "*");
console.log(mask("4111111111111111"));
console.log(String(7).padStart(3, "0"), "abc".padEnd(8, "12"));
