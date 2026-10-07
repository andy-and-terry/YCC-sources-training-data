export type Result<T, E = Error> = { ok: true; value: T } | { ok: false; error: E };

export const ok = <T>(value: T): Result<T, never> => ({ ok: true, value });
export const err = <E>(error: E): Result<never, E> => ({ ok: false, error });

export function map<T, U, E>(r: Result<T, E>, f: (t: T) => U): Result<U, E> {
  return r.ok ? ok(f(r.value)) : r;
}

export function parseIntSafe(s: string): Result<number, string> {
  const n = Number.parseInt(s, 10);
  return Number.isNaN(n) ? err(`not a number: ${s}`) : ok(n);
}

for (const s of ["42", "abc"]) {
  const r = map(parseIntSafe(s), (n) => n * 2);
  console.log(r.ok ? `value ${r.value}` : `error ${r.error}`);
}
