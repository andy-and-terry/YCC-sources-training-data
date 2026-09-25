export interface Item { name: string; value: number; weight: number }
export interface Taken extends Item { fraction: number }

export function fractionalKnapsack(items: readonly Item[], capacity: number): { value: number; taken: Taken[] } {
  const byRatio = [...items].sort((a, b) => b.value / b.weight - a.value / a.weight);
  const taken: Taken[] = [];
  let value = 0;
  for (const item of byRatio) {
    if (capacity <= 0) break;
    const amount = Math.min(item.weight, capacity);
    const fraction = amount / item.weight;
    taken.push({ ...item, fraction });
    value += item.value * fraction;
    capacity -= amount;
  }
  return { value, taken };
}

const { value, taken } = fractionalKnapsack(
  [
    { name: "saffron", value: 60, weight: 10 },
    { name: "vanilla", value: 100, weight: 20 },
    { name: "pepper", value: 120, weight: 30 },
  ],
  50,
);
console.log(value);
for (const t of taken) console.log(`${t.name}: ${(t.fraction * 100).toFixed(1)}%`);
