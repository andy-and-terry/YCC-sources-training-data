class Cache {
  constructor() {
    this.entries = new Map();
    this.registry = new FinalizationRegistry((key) => {
      this.entries.delete(key);
      this.collected = (this.collected || 0) + 1;
    });
  }

  set(key, value) {
    const ref = new WeakRef(value);
    this.entries.set(key, ref);
    this.registry.register(value, key);
    return ref;
  }

  get(key) {
    const ref = this.entries.get(key);
    return ref ? ref.deref() : undefined;
  }

  get size() {
    return this.entries.size;
  }
}

const cache = new Cache();
let payload = { large: 'data'.repeat(100) };
cache.set('item1', payload);

console.log(cache.get('item1')?.large.length);
console.log('cache size:', cache.size);

payload = null;
console.log('reference cleared, cache still tracks key until GC runs');

module.exports = { Cache };
