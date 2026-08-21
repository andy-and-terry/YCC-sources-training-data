export type Result<T, E = string> = { ok: true; value: T } | { ok: false; error: E };

export function tryParseInt(input: string): Result<number> {
  const value = Number.parseInt(input, 10);
  if (Number.isNaN(value)) return { ok: false, error: `invalid integer: ${input}` };
  return { ok: true, value };
}
