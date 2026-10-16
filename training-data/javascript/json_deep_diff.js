function diff(a, b, path = "") {
  const changes = [];
  const keys = new Set([...Object.keys(a ?? {}), ...Object.keys(b ?? {})]);
  for (const k of keys) {
    const p = path ? `${path}.${k}` : k;
    const x = a?.[k];
    const y = b?.[k];
    if (x && y && typeof x === "object" && typeof y === "object") {
      changes.push(...diff(x, y, p));
    } else if (!(k in (a ?? {}))) {
      changes.push({ path: p, type: "added", to: y });
    } else if (!(k in (b ?? {}))) {
      changes.push({ path: p, type: "removed", from: x });
    } else if (x !== y) {
      changes.push({ path: p, type: "changed", from: x, to: y });
    }
  }
  return changes;
}

const before = { name: "app", version: 1, deps: { a: 1, b: 2 } };
const after = { name: "app", version: 2, deps: { a: 1, c: 3 } };
console.log(diff(before, after));
