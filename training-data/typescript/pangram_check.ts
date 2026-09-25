export const isPangram = (s: string): boolean =>
  new Set(s.toLowerCase().match(/[a-z]/g) ?? []).size === 26;

console.log(isPangram("Pack my box with five dozen liquor jugs"));
