// Labeled and readonly tuples, plus tuple destructuring with rest elements.
type Span = readonly [start: number, end: number];
type Row = [id: number, ...tags: string[]];

function spanLength([start, end]: Span): number {
  return end - start;
}

const r: Span = [3, 10];
const row: Row = [1, "a", "b"];
const [id, ...tags] = row;

console.log(spanLength(r), id, tags);
