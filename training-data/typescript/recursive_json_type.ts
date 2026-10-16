type Json = string | number | boolean | null | Json[] | { [key: string]: Json };

function stringify(value: Json, indent = 0): string {
  const pad = " ".repeat(indent);
  if (Array.isArray(value)) {
    if (value.length === 0) return "[]";
    return "[\n" + value.map((v) => pad + "  " + stringify(v, indent + 2)).join(",\n") + "\n" + pad + "]";
  }
  if (value !== null && typeof value === "object") {
    const entries = Object.entries(value);
    if (entries.length === 0) return "{}";
    return (
      "{\n" +
      entries.map(([k, v]) => `${pad}  "${k}": ${stringify(v, indent + 2)}`).join(",\n") +
      "\n" +
      pad +
      "}"
    );
  }
  return JSON.stringify(value);
}

const doc: Json = { name: "widget", tags: ["a", "b"], dims: { w: 2, h: 3 }, extra: null };
console.log(stringify(doc));
