type Query = Record<string, string | string[]>;

function parseQuery(qs: string): Query {
  const result: Query = {};
  const trimmed = qs.startsWith("?") ? qs.slice(1) : qs;
  if (trimmed === "") return result;

  for (const pair of trimmed.split("&")) {
    const [rawKey, rawValue = ""] = pair.split("=");
    const key = decodeURIComponent(rawKey);
    const value = decodeURIComponent(rawValue.replace(/\+/g, " "));
    const existing = result[key];
    if (existing === undefined) {
      result[key] = value;
    } else if (Array.isArray(existing)) {
      existing.push(value);
    } else {
      result[key] = [existing, value];
    }
  }
  return result;
}

function stringifyQuery(query: Query): string {
  return Object.entries(query)
    .flatMap(([k, v]) => (Array.isArray(v) ? v : [v]).map((x) => `${encodeURIComponent(k)}=${encodeURIComponent(x)}`))
    .join("&");
}

const parsed = parseQuery("?q=hello+world&tag=a&tag=b&page=2");
console.log(parsed);
console.log(stringifyQuery(parsed));
