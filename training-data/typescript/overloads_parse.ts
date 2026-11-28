function parse(v: string): number;
function parse(v: string[]): number[];
function parse(v: string | string[]) {
  return Array.isArray(v) ? v.map(Number) : Number(v);
}

console.log(parse("4"), parse(["1", "2"]));
