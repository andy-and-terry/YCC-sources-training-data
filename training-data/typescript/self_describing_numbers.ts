function isSelfDescribing(n: number): boolean {
  const s = String(n);
  return [...s].every((d, i) => s.split(String(i)).length - 1 === Number(d));
}

for (const n of [1210, 2020, 21200, 1211]) console.log(n, isSelfDescribing(n));
