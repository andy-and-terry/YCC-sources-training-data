function parseQuery(qs) {
  const result = {};
  for (const pair of qs.replace(/^\?/, "").split("&")) {
    if (!pair) continue;
    const idx = pair.indexOf("=");
    const rawKey = idx < 0 ? pair : pair.slice(0, idx);
    const rawVal = idx < 0 ? "" : pair.slice(idx + 1);
    const key = decodeURIComponent(rawKey.replace(/\+/g, " "));
    const val = decodeURIComponent(rawVal.replace(/\+/g, " "));
    (result[key] ||= []).push(val);
  }
  return result;
}

function buildQuery(params) {
  return Object.entries(params)
    .flatMap(([k, vs]) => [].concat(vs).map((v) => `${encodeURIComponent(k)}=${encodeURIComponent(v)}`))
    .join("&");
}

const q = parseQuery("?name=J%C3%BCrgen+M&tag=a&tag=b&empty=");
console.log(q);
console.log(buildQuery(q));
module.exports = { parseQuery, buildQuery };
