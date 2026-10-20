function pad(v: string): string;
function pad(v: number): number;
function pad(v: string | number) { return typeof v === "string" ? v.padStart(4, "0") : v * 2; }
console.log(pad("7"), pad(4));
