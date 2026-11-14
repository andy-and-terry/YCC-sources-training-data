declare const brand: unique symbol;
type Meters = number & { [brand]: "m" };

const m = (n: number) => n as Meters;
const add = (a: Meters, b: Meters) => m(a + b);

console.log(add(m(1), m(2)));
