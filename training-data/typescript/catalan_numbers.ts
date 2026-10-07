export function catalanDp(n: number): bigint[] {
  const c: bigint[] = new Array(n + 1).fill(0n);
  c[0] = 1n;
  for (let i = 1; i <= n; i++) for (let j = 0; j < i; j++) c[i] += c[j] * c[i - 1 - j];
  return c;
}

export function catalanClosed(n: number): bigint {
  let c = 1n;
  for (let k = 0n; k < BigInt(n); k++) c = (c * 2n * (2n * k + 1n)) / (k + 2n);
  return c;
}

/** All balanced bracket strings for n pairs — there are Catalan(n) of them. */
function brackets(n: number): string[] {
  if (n === 0) return [""];
  const out: string[] = [];
  for (let i = 0; i < n; i++)
    for (const a of brackets(i)) for (const b of brackets(n - 1 - i)) out.push(`(${a})${b}`);
  return out;
}

const dp = catalanDp(20);
console.log(dp.join(" "));
console.log("closed form agrees:", dp.every((v, i) => v === catalanClosed(i)));
console.log(brackets(3), brackets(5).length === Number(dp[5]));
