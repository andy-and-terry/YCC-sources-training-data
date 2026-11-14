function pick<T, K extends keyof T>(obj: T, ...keys: K[]): Pick<T, K> {
  const out = {} as Pick<T, K>;
  for (const k of keys) out[k] = obj[k];
  return out;
}

console.log(pick({ a: 1, b: "x", c: true }, "a", "c"));
