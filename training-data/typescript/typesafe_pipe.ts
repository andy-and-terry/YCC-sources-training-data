function pipe<A, B>(fn1: (input: A) => B): (input: A) => B;
function pipe<A, B, C>(fn1: (input: A) => B, fn2: (input: B) => C): (input: A) => C;
function pipe<A, B, C, D>(fn1: (input: A) => B, fn2: (input: B) => C, fn3: (input: C) => D): (input: A) => D;
function pipe(...fns: Array<(input: unknown) => unknown>): (input: unknown) => unknown {
  return (input: unknown) => fns.reduce((acc, fn) => fn(acc), input);
}

const parseNumber = (input: string): number => Number(input);
const double = (n: number): number => n * 2;
const toLabel = (n: number): string => `value: ${n}`;

const process = pipe(parseNumber, double, toLabel);
console.log(process("21"));

const shout = pipe(
  (s: string) => s.trim(),
  (s: string) => s.toUpperCase(),
);
console.log(shout("  hi there  "));

// pipe(parseNumber, toLabel, double); // compile-time error: toLabel's output (string)
// doesn't match double's expected input (number)
