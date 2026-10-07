function parseValue(value: string): string[];
function parseValue(value: number): number;
function parseValue(value: boolean): boolean;
function parseValue(value: string | number | boolean): string[] | number | boolean {
  if (typeof value === "string") {
    return value.split(",").map((s) => s.trim());
  }
  return value;
}

const parts = parseValue("a, b, c");
const doubled = parseValue(21);
const flag = parseValue(true);

console.log(parts, doubled, flag);

interface Point2D {
  x: number;
  y: number;
}

interface Point3D {
  x: number;
  y: number;
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
