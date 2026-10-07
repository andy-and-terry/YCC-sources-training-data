type Curry<Fn extends (...args: any[]) => unknown> = Fn extends (first: infer First, ...rest: infer Rest) => infer Return
  ? Rest extends []
    ? (first: First) => Return
    : (first: First) => Curry<(...rest: Rest) => Return>
  : never;

function curry<Fn extends (...args: any[]) => unknown>(fn: Fn): Curry<Fn> {
  function curried(...args: unknown[]): unknown {
    if (args.length >= fn.length) return fn(...args);
    return (...more: unknown[]) => curried(...args, ...more);
  }
  return curried as Curry<Fn>;
}

function addThree(a: number, b: number, c: number): number {
  return a + b + c;
}

const curriedAdd = curry(addThree);
const step1 = curriedAdd(1);
const step2 = step1(2);
const total = step2(3);

console.log(total);
console.log(curriedAdd(10)(20)(30));

function labelPoint(x: number, y: number): string {
  return `(${x}, ${y})`;
}

const curriedLabel = curry(labelPoint);
console.log(curriedLabel(1)(2));
