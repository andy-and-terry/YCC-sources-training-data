type Result<T, E> = { ok: true; value: T } | { ok: false; error: E };
const ok = <T>(value: T): Result<T, never> => ({ ok: true, value });
const err = <E>(error: E): Result<never, E> => ({ ok: false, error });
function parseIntR(s: string): Result<number, string> {
  const n = Number.parseInt(s, 10);
  return Number.isNaN(n) ? err(`bad: ${s}`) : ok(n);
}
for (const s of ["12", "x"]) { const r = parseIntR(s); console.log(r.ok ? r.value : r.error); }
