const orders = [
  { id: 1, status: "paid" },
  { id: 2, status: "open" },
  { id: 3, status: "paid" },
];
const grouped = Object.groupBy(orders, (o) => o.status);
console.log(Object.fromEntries(Object.entries(grouped).map(([k, v]) => [k, v.length])));
