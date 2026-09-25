export function abbreviate(phrase: string): string {
  const words = phrase.replace(/[-_]/g, " ").match(/[A-Za-z][A-Za-z']*/g) ?? [];
  return words.map((w) => w[0].toUpperCase()).join("");
}

console.log(abbreviate("As Soon As Possible"), abbreviate("The Road _Not_ Taken"));
