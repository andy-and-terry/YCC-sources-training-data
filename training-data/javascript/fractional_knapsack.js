function fractionalKnapsack(items, capacity) {
  let total = 0;
  const taken = [];
  for (const it of [...items].sort((a, b) => b.value / b.weight - a.value / a.weight)) {
    if (capacity <= 0) break;
    const amount = Math.min(it.weight, capacity);
    total += (it.value * amount) / it.weight;
    taken.push({ ...it, fraction: amount / it.weight });
    capacity -= amount;
  }
  return { total, taken };
}

const res = fractionalKnapsack(
  [{ name: "gold", value: 60, weight: 10 }, { name: "silver", value: 100, weight: 20 }, { name: "bronze", value: 120, weight: 30 }],
  50,
);
console.log(res.total);
console.table(res.taken);
module.exports = { fractionalKnapsack };
