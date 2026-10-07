interface StringDictionary {
  [key: string]: string;
}

interface SparseArray<T> {
  [index: number]: T;
  length: number;
}

const headers: StringDictionary = {
  'content-type': 'application/json',
  authorization: 'Bearer token',
};

function describeHeaders(dict: StringDictionary): string[] {
  return Object.keys(dict).map((key) => `${key}: ${dict[key]}`);
}

console.log(describeHeaders(headers));

const sparse: SparseArray<number> = { 0: 10, 5: 50, length: 6 };
console.log(sparse[0], sparse[5], sparse.length);

class TypedCache<V> {
  private readonly store: { [key: string]: V } = {};

  set(key: string, value: V): void {
    this.store[key] = value;
  }

  get(key: string): V | undefined {
    return this.store[key];
  }
}

const cache = new TypedCache<number>();
cache.set('answer', 42);
console.log(cache.get('answer'));
