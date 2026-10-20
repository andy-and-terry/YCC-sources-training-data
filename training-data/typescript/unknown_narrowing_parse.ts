function parse(json: string): unknown { return JSON.parse(json); }
const v = parse('{"n":3}');
if (typeof v === "object" && v !== null && "n" in v) console.log((v as { n: number }).n);
