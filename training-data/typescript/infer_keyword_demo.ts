type UnwrapPromise<T> = T extends Promise<infer U> ? U : T;

type ReturnOf<F> = F extends (...args: any[]) => infer R ? R : never;

type FirstArg<F> = F extends (arg: infer A, ...rest: any[]) => unknown ? A : never;

async function fetchScore(): Promise<number> {
  return 42;
}

function greet(name: string): string {
  return `hello, ${name}`;
}

type Score = UnwrapPromise<ReturnType<typeof fetchScore>>;
type GreetReturn = ReturnOf<typeof greet>;
type GreetArg = FirstArg<typeof greet>;

const score: Score = 100;
const message: GreetReturn = "hi";
const arg: GreetArg = "world";

console.log(score, message, greet(arg));
