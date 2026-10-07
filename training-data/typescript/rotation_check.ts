export const isRotation = (a: string, b: string): boolean =>
  a.length === b.length && (a + a).includes(b);

export function rotationOffset(a: string, b: string): number {
  return isRotation(a, b) ? (a + a).indexOf(b) : -1;
}

console.log(isRotation("waterbottle", "erbottlewat"), rotationOffset("waterbottle", "erbottlewat"));
