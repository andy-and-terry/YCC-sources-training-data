const SUFFIX: Record<number, string> = { 1: "st", 2: "nd", 3: "rd" };

function ordinal(n: number): string {
  const rem100 = n % 100;
  const suffix = rem100 >= 11 && rem100 <= 13 ? "th" : SUFFIX[n % 10] ?? "th";
  return `${n}${suffix}`;
}

console.log([1, 2, 3, 4, 11, 12, 13, 21, 101, 111].map(ordinal).join(" "));
