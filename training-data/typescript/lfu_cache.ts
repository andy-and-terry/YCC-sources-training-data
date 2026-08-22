class LFUCache<K, V> {
  private values = new Map<K, V>();
  private freq = new Map<K, number>();
  private freqGroups = new Map<number, Set<K>>();
  private minFreq = 0;

  constructor(private capacity: number) {}

  private bump(key: K): void {
    const freq = this.freq.get(key)!;
    this.freqGroups.get(freq)!.delete(key);
    if (this.freqGroups.get(freq)!.size === 0 && this.minFreq === freq) this.minFreq++;
    this.freq.set(key, freq + 1);
    if (!this.freqGroups.has(freq + 1)) this.freqGroups.set(freq + 1, new Set());
    this.freqGroups.get(freq + 1)!.add(key);
  }

  get(key: K): V | undefined {
    if (!this.values.has(key)) return undefined;
    this.bump(key);
    return this.values.get(key);
  }

  put(key: K, value: V): void {
    if (this.capacity <= 0) return;
    if (this.values.has(key)) {
      this.values.set(key, value);
      this.bump(key);
      return;
    }
    if (this.values.size >= this.capacity) {
      const [evictKey] = this.freqGroups.get(this.minFreq)!;
      this.freqGroups.get(this.minFreq)!.delete(evictKey);
      this.values.delete(evictKey);
      this.freq.delete(evictKey);
    }
    this.values.set(key, value);
    this.freq.set(key, 1);
    if (!this.freqGroups.has(1)) this.freqGroups.set(1, new Set());
    this.freqGroups.get(1)!.add(key);
    this.minFreq = 1;
  }
}

const cache = new LFUCache<string, number>(2);
cache.put('a', 1);
cache.put('b', 2);
cache.get('a');
cache.put('c', 3);
console.log(cache.get('b'), cache.get('a'), cache.get('c'));
