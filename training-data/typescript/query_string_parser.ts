type QueryValue = string | string[];
type Query = Record<string, QueryValue>;

export function parseQuery(qs: string): Query {
  const out: Query = {};
  for (const pair of qs.replace(/^\?/, "").split("&")) {
    if (!pair) continue;
    const eq = pair.indexOf("=");
    const dec = (s: string): string => decodeURIComponent(s.replace(/\+/g, " "));
    const key = dec(eq < 0 ? pair : pair.slice(0, eq));
    const val = dec(eq < 0 ? "" : pair.slice(eq + 1));
    const prev = out[key];
    out[key] = prev === undefined ? val : Array.isArray(prev) ? [...prev, val] : [prev, val];
  }
  return out;
}

export function stringifyQuery(q: Query): string {
  return Object.entries(q)
    .flatMap(([k, v]) => (Array.isArray(v) ? v : [v]).map((x) => `${encodeURIComponent(k)}=${encodeURIComponent(x)}`))
    .join("&");
}

const q = parseQuery("?name=J%C3%BCrgen+M&tag=a&tag=b&empty=");
console.log(q);
console.log(stringifyQuery(q));
