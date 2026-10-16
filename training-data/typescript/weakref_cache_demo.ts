class Payload {
  constructor(public readonly id: number) {}
}

class WeakCache<K, V extends object> {
  private refs = new Map<K, WeakRef<V>>();

  set(key: K, value: V): void {
    this.refs.set(key, new WeakRef(value));
  }

  get(key: K): V | undefined {
    const value = this.refs.get(key)?.deref();
    if (value === undefined) this.refs.delete(key);
    return value;
  }
}

const cache = new WeakCache<string, Payload>();
const keep = new Payload(1);
cache.set("a", keep);
console.log(cache.get("a")?.id);
console.log(cache.get("missing"));
