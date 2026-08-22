class HashMap<K extends string | number, V> {
  private buckets: Array<Array<[K, V]>>;

  constructor(private size: number = 16) {
    this.buckets = Array.from({ length: size }, () => []);
  }

  private hash(key: K): number {
    const str = String(key);
    let hash = 0;
    for (let i = 0; i < str.length; i++) {
      hash = (hash * 31 + str.charCodeAt(i)) % this.size;
    }
    return hash;
  }

  set(key: K, value: V): void {
    const bucket = this.buckets[this.hash(key)];
    const existing = bucket.find(([k]) => k === key);
    if (existing) existing[1] = value;
    else bucket.push([key, value]);
  }

  get(key: K): V | undefined {
    const bucket = this.buckets[this.hash(key)];
    return bucket.find(([k]) => k === key)?.[1];
  }
}

const map = new HashMap<string, number>();
map.set("a", 1);
map.set("b", 2);
console.log(map.get("a"), map.get("b"), map.get("c"));
