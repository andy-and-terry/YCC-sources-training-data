export function startingStation(gas: readonly number[], cost: readonly number[]): number {
  if (gas.length !== cost.length) throw new RangeError("length mismatch");
  let total = 0, tank = 0, start = 0;
  gas.forEach((g, i) => {
    const diff = g - cost[i];
    total += diff;
    tank += diff;
    if (tank < 0) {
      start = i + 1;
      tank = 0;
    }
  });
  return total < 0 ? -1 : start;
}

export function simulate(gas: readonly number[], cost: readonly number[], start: number): boolean {
  let tank = 0;
  for (let k = 0; k < gas.length; k++) {
    const i = (start + k) % gas.length;
    tank += gas[i] - cost[i];
    if (tank < 0) return false;
  }
  return true;
}

const gas = [1, 2, 3, 4, 5], cost = [3, 4, 5, 1, 2];
const s = startingStation(gas, cost);
console.log(s, simulate(gas, cost, s), startingStation([2, 3, 4], [3, 4, 3]));
