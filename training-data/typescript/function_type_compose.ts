const compose = <A, B, C>(f: (b: B) => C, g: (a: A) => B) => (a: A): C => f(g(a));
const len = compose((n: number) => n * 2, (s: string) => s.length);
console.log(len("hello"));
