// padStart / padEnd / repeat for aligned plain-text tables.

const rows = [
  { item: "Coffee", qty: 3, price: 4.5 },
  { item: "Bagel", qty: 12, price: 2.25 },
  { item: "Tea", qty: 1, price: 3 },
];

const header = "Item".padEnd(10) + "Qty".padStart(5) + "Price".padStart(10);
console.log(header);
console.log("-".repeat(header.length));

let total = 0;
for (const { item, qty, price } of rows) {
  const line = qty * price;
  total += line;
  console.log(
    item.padEnd(10) +
      String(qty).padStart(5) +
      line.toFixed(2).padStart(10)
  );
}

console.log("=".repeat(header.length));
console.log("Total".padEnd(15) + total.toFixed(2).padStart(10));

// Pad with a custom fill string, truncated to fit
console.log("7".padStart(4, "0"));
console.log("ab".padEnd(7, "123"));
console.log("id:" + String(42).padStart(6, "."));
