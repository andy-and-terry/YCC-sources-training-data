function pad(s: string, n: number): string;
function pad(s: number, n: number): string;
function pad(s: string | number, n: number): string {
  return String(s).padStart(n, "0");
}
console.log(pad(7, 3), pad("ab", 4));
