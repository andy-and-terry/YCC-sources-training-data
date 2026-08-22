class LRUCache {
  #capacity;
  #store = new Map();

  constructor(capacity) {
    if (capacity <= 0) throw new Error('capacity must be positive');
    this.#capacity = capacity;
  }

  get(key) {
    if (!this.#store.has(key)) return undefined;
    const value = this.#store.get(key);
    this.#store.delete(key);
    this.#store.set(key, value);
    return value;
  }

  put(key, value) {
    if (this.#store.has(key)) this.#store.delete(key);
    this.#store.set(key, value);
    if (this.#store.size > this.#capacity) {
      this.#store.delete(this.#store.keys().next().value);
    }
  }

  has(key) {
    return this.#store.has(key);
  }
}

const cache = new LRUCache(2);
cache.put('a', 1);
cache.put('b', 2);
cache.get('a');
cache.put('c', 3); // evicts 'b'
console.log(cache.has('b'), cache.has('a'), cache.has('c'));
module.exports = { LRUCache };
