export class LRUCache<K, V> {
  private capacity: number;
  private map: Map<K, V> = new Map();

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  get(key: K): V | undefined {
    if (!this.map.has(key)) return undefined;
    const value = this.map.get(key)!;
    this.map.delete(key);
    this.map.set(key, value);
    return value;
  }

  put(key: K, value: V): void {
    if (this.map.has(key)) this.map.delete(key);
    else if (this.map.size >= this.capacity) {
      const oldestKey = this.map.keys().next().value;
      this.map.delete(oldestKey as K);
    }
    this.map.set(key, value);
  }
}
