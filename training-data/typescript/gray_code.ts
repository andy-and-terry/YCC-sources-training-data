export const toGray = (n: number): number => n ^ (n >>> 1);

export function fromGray(g: number): number {
  let b = 0;
  for (; g; g >>>= 1) b ^= g;
  return b;
}

/** Reflect-and-prefix construction, returning bit strings. */
export function grayStrings(bits: number): string[] {
  let codes = [""];
  for (let i = 0; i < bits; i++) codes = [...codes.map((c) => "0" + c), ...codes.reverse().map((c) => "1" + c)];
  return codes;
}

const strs = grayStrings(4);
strs.forEach((s, i) => {
  if (parseInt(s, 2) !== toGray(i) || fromGray(toGray(i)) !== i) throw new Error(`mismatch at ${i}`);
});
console.log(strs.join(" "));
