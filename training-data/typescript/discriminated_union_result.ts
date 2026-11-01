type Result<T, E> = { ok: true; value: T } | { ok: false; error: E };

function parseIntSafe(s: string): Result<number, string> {
  const n = Number.parseInt(s, 10);
  return Number.isNaN(n) ? { ok: false, error: `bad int: ${s}` } : { ok: true, value: n };
}

for (const s of ["42", "x"]) {
  const r = parseIntSafe(s);
  console.log(r.ok ? r.value : r.error);
}
