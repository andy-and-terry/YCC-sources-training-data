type Row = [id: number, name: string, ...tags: string[]];
const r: Row = [1, "a", "x", "y"];
const [id, label, ...tags] = r;
console.log(id, label, tags);
