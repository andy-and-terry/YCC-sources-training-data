interface Inventory {
  [item: string]: number;
}

const stock: Inventory = { apples: 4, pears: 0 };
stock["plums"] = 12;

function totalItems(inv: Inventory): number {
  return Object.values(inv).reduce((sum, n) => sum + n, 0);
}
console.log(totalItems(stock));

// Known keys mixed with an index signature must be compatible with it.
interface Config {
  name: string;
  retries: number;
  [extra: string]: string | number;
}
const cfg: Config = { name: "svc", retries: 3, region: "eu" };
console.log(cfg.region);

// Template literal index signatures
type DataAttrs = { [key: `data-${string}`]: string };
const attrs: DataAttrs = { "data-id": "7", "data-role": "admin" };
console.log(attrs["data-role"]);

// Safer lookups with noUncheckedIndexedAccess-style handling
const count = stock["bananas"] ?? 0;
console.log(count);
