function flattenObject(obj, prefix = "", out = {}) {
  for (const [key, value] of Object.entries(obj)) {
    const path = prefix ? `${prefix}.${key}` : key;
    if (value && typeof value === "object" && !Array.isArray(value)) {
      flattenObject(value, path, out);
    } else {
      out[path] = value;
    }
  }
  return out;
}

function unflattenObject(flat) {
  const root = {};
  for (const [path, value] of Object.entries(flat)) {
    const keys = path.split(".");
    let node = root;
    keys.slice(0, -1).forEach((k) => {
      node = node[k] ??= {};
    });
    node[keys.at(-1)] = value;
  }
  return root;
}

const nested = { a: 1, b: { c: 2, d: { e: [3, 4] } } };
const flat = flattenObject(nested);
console.log(flat);
console.log(JSON.stringify(unflattenObject(flat)) === JSON.stringify(nested));
