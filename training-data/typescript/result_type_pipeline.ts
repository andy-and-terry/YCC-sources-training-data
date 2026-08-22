type Result<T, E = string> = { ok: true; value: T } | { ok: false; error: E };

function ok<T>(value: T): Result<T, never> {
  return { ok: true, value };
}

function err<E>(error: E): Result<never, E> {
  return { ok: false, error };
}

function map<T, U, E>(result: Result<T, E>, fn: (value: T) => U): Result<U, E> {
  return result.ok ? ok(fn(result.value)) : result;
}

function flatMap<T, U, E>(result: Result<T, E>, fn: (value: T) => Result<U, E>): Result<U, E> {
  return result.ok ? fn(result.value) : result;
}

function parsePositiveInt(input: string): Result<number> {
  const n = Number(input);
  if (!Number.isInteger(n)) return err(`not an integer: ${input}`);
  if (n <= 0) return err(`not positive: ${input}`);
  return ok(n);
}

const piped = flatMap(parsePositiveInt('21'), (n) => map(ok(n), (x) => x * 2));
console.log(piped);
console.log(parsePositiveInt('-5'));
