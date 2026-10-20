type ElementOf<T> = T extends (infer U)[] ? U : never;
type Ret<T> = T extends (...a: any[]) => infer R ? R : never;
const f = () => [1, 2, 3];
const x: ElementOf<Ret<typeof f>> = 5;
console.log(x);
