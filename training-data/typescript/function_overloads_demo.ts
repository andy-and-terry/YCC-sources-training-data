function parseValue(input: string): string;
function parseValue(input: number): number;
function parseValue(input: string, radix: number): number;
function parseValue(input: string | number, radix?: number): string | number {
  if (typeof input === "number") {
    return input;
  }
  if (radix !== undefined) {
    return parseInt(input, radix);
  }
  return input.trim();
}

console.log(parseValue("  hello  "));
console.log(parseValue(42));
console.log(parseValue("ff", 16));

interface Point2D {
  x: number;
  y: number;
}

interface Point3D extends Point2D {
  z: number;
}

function makePoint(x: number, y: number): Point2D;
function makePoint(x: number, y: number, z: number): Point3D;
function makePoint(x: number, y: number, z?: number): Point2D | Point3D {
  return z === undefined ? { x, y } : { x, y, z };
}

const flat = makePoint(1, 2);
const spatial = makePoint(1, 2, 3);
console.log(flat, spatial);
