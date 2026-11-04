function ordinal(n) {
  const rem100 = n % 100;
  if (rem100 >= 11 && rem100 <= 13) return `${n}th`;
  return `${n}${{ 1: "st", 2: "nd", 3: "rd" }[n % 10] ?? "th"}`;
}

console.log([1, 2, 3, 4, 11, 12, 13, 21, 22, 101, 111].map(ordinal).join(" "));
