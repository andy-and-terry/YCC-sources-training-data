interface Row {
  item: string;
  qty: number;
  price: number;
}

function formatTable(rows: Row[]): string {
  const header = `${"Item".padEnd(10)}${"Qty".padStart(5)}${"Price".padStart(10)}`;
  const lines = rows.map(
    (r) => `${r.item.padEnd(10)}${String(r.qty).padStart(5)}${r.price.toFixed(2).padStart(10)}`,
  );
  const total = rows.reduce((sum, r) => sum + r.qty * r.price, 0);
  return [header, "-".repeat(25), ...lines, "-".repeat(25), `${"Total".padEnd(15)}${total.toFixed(2).padStart(10)}`].join("\n");
}

console.log(
  formatTable([
    { item: "Widget", qty: 4, price: 2.5 },
    { item: "Gadget", qty: 1, price: 19.99 },
    { item: "Bolt", qty: 100, price: 0.05 },
  ]),
);
