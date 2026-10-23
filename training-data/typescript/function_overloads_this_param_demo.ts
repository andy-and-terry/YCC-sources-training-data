// Overload signatures describe the public API; the implementation is hidden.
function toArray(value: string): string[];
function toArray(value: number): number[];
function toArray(value: string | number): (string | number)[] {
  if (typeof value === "string") {
    return value.split("");
  }
  return String(value).split("").map(Number);
}

function pick(items: number[]): number;
function pick(items: number[], count: number): number[];
function pick(items: number[], count?: number): number | number[] {
  return count === undefined ? items[0] : items.slice(0, count);
}

interface Formatter {
  (value: Date): string;
  (value: number, digits: number): string;
}

const format: Formatter = (value: Date | number, digits?: number): string =>
  value instanceof Date
    ? value.toISOString().slice(0, 10)
    : value.toFixed(digits ?? 0);

const letters = toArray("abc");
const digits = toArray(2024);
console.log(letters, digits);
console.log(pick([10, 20, 30]), pick([10, 20, 30], 2));
console.log(format(new Date(Date.UTC(2024, 0, 15))), format(3.14159, 2));
