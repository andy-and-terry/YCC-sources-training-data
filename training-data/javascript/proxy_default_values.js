const withDefault = (obj, def) => new Proxy(obj, { get: (t, k) => (k in t ? t[k] : def) });
const counts = withDefault({ a: 1 }, 0);
console.log(counts.a, counts.zzz);
