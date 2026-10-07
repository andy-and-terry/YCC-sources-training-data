export function hamming(a: string, b: string): number {
  if (a.length !== b.length) throw new Error("strands must be of equal length");
  return [...a].filter((ch, i) => ch !== b[i]).length;
}

console.log(hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"));
