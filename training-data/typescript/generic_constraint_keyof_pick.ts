function pick<T, K extends keyof T>(o: T, keys: K[]): Pick<T, K> {
  const out = {} as Pick<T, K>;
  for (const k of keys) out[k] = o[k];
  return out;
}

const user = { id: 1, name: "ann", email: "a@x.io" };
console.log(pick(user, ["id", "name"]));
