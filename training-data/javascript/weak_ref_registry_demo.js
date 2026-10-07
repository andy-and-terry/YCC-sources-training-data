class Cache {
  #refs = new Map();
  #registry = new FinalizationRegistry((key) => {
    this.#refs.delete(key);
  });

  set(key, value) {
    this.#refs.set(key, new WeakRef(value));
    this.#registry.register(value, key);
    return this;
  }

  get(key) {
    const ref = this.#refs.get(key);
    if (!ref) return undefined;
    return ref.deref();
  }

  has(key) {
    return this.get(key) !== undefined;
  }
}

let value = { name: 'cached payload' };
const cache = new Cache();
cache.set('item', value);
console.log(cache.get('item'));

value = null;
console.log(typeof cache.get('item'));

module.exports = { Cache };
