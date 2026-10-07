function deepClone<T>(value: T, seen = new WeakMap<object, unknown>()): T {
  if (value === null || typeof value !== "object") return value;
  const obj = value as unknown as object;
  if (seen.has(obj)) return seen.get(obj) as T;

  if (value instanceof Date) return new Date(value.getTime()) as unknown as T;
  if (value instanceof Map) {
    const m = new Map();
    seen.set(obj, m);
    value.forEach((v, k) => m.set(deepClone(k, seen), deepClone(v, seen)));
    return m as unknown as T;
  }
  if (value instanceof Set) {
    const s = new Set();
    seen.set(obj, s);
    value.forEach((v) => s.add(deepClone(v, seen)));
    return s as unknown as T;
  }

  const copy: any = Array.isArray(value) ? [] : {};
  seen.set(obj, copy);
  for (const key of Object.keys(value as object)) {
    copy[key] = deepClone((value as any)[key], seen);
  }
  return copy as T;
}

const original: any = { n: 1, list: [1, { x: 2 }], when: new Date(0), tags: new Set(["a"]) };
original.self = original;
const copy = deepClone(original);
console.log(copy !== original, copy.list[1] !== original.list[1], copy.self === copy);
