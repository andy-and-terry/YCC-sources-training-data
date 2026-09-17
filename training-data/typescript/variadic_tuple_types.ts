type Head<T extends unknown[]> = T extends [infer H, ...unknown[]] ? H : never;
type Tail<T extends unknown[]> = T extends [unknown, ...infer R] ? R : [];

function prepend<T, Rest extends unknown[]>(item: T, rest: [...Rest]): [T, ...Rest] {
  return [item, ...rest];
}

function concat<A extends unknown[], B extends unknown[]>(a: [...A], b: [...B]): [...A, ...B] {
  return [...a, ...b];
}

type Point3D = [x: number, y: number, z: number];

const withOrigin = prepend("origin", [0, 0, 0] as Point3D);
const combined = concat([1, 2], ["a", "b", "c"]);

type First = Head<Point3D>;
type Rest = Tail<Point3D>;

const first: First = 0;
const rest: Rest = [0, 0];

console.log(withOrigin, combined, first, rest);
