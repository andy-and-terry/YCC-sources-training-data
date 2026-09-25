const TOMBSTONE = Symbol("tombstone");
type Slot<K> = K | typeof TOMBSTONE | undefined;

/** Open-addressing hash set with quadratic probing for string keys. */
export class StringHashSet {
  private slots: Slot<string>[] = new Array(8);
  private used = 0; // live + tombstones
  size = 0;

  private static hash(s: string): number {
    let h = 5381;
    for (let i = 0; i < s.length; i++) h = ((h << 5) + h + s.charCodeAt(i)) | 0;
    return h >>> 0;
  }

  private *probe(key: string): Generator<number> {
    const cap = this.slots.length;
    const h = StringHashSet.hash(key);
    for (let i = 0; i < cap; i++) yield (h + (i * (i + 1)) / 2) % cap;
  }

  has(key: string): boolean {
    for (const i of this.probe(key)) {
      const s = this.slots[i];
      if (s === undefined) return false;
      if (s === key) return true;
    }
    return false;
  }

  add(key: string): void {
    if (this.has(key)) return;
    if ((this.used + 1) * 4 > this.slots.length * 3) this.rehash();
    for (const i of this.probe(key)) {
      const s = this.slots[i];
      if (s === undefined || s === TOMBSTONE) {
        if (s === undefined) this.used++;
        this.slots[i] = key;
        this.size++;
        return;
      }
    }
  }

  delete(key: string): boolean {
    for (const i of this.probe(key)) {
      const s = this.slots[i];
      if (s === undefined) return false;
      if (s === key) {
        this.slots[i] = TOMBSTONE;
        this.size--;
        return true;
      }
    }
    return false;
  }

  private rehash(): void {
    const live = this.slots.filter((s): s is string => typeof s === "string");
    this.slots = new Array(this.slots.length * 2);
    this.used = this.size = 0;
    live.forEach((k) => this.add(k));
  }
}

const set = new StringHashSet();
"the quick brown fox jumps over the lazy dog".split(" ").forEach((w) => set.add(w));
set.delete("fox");
console.log(set.size, set.has("fox"), set.has("lazy"));
