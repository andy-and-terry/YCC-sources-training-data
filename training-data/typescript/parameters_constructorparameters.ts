function mk(a: number, b: string) { return { a, b }; }
type P = Parameters<typeof mk>;
const args: P = [1, "x"];
console.log(mk(...args));
class K { constructor(public x: number) {} }
const cp: ConstructorParameters<typeof K> = [5];
console.log(new K(...cp).x);
