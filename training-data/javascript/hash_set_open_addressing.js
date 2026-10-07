const DELETED = Symbol("deleted");

function hashString(s) {
  let h = 2166136261;
  for (let i = 0; i < s.length; i++) h = Math.imul(h ^ s.charCodeAt(i), 16777619);
  return h >>> 0;
}

class OpenHashSet {
  constructor(capacity = 8) {
    this.slots = new Array(capacity).fill(undefined);
    this.count = 0;
  }

  *#probe(key) {
    let i = hashString(String(key)) % this.slots.length;
    for (;;) {
      yield i;
      i = (i + 1) % this.slots.length;
    }
  }

  add(key) {
    if ((this.count + 1) * 2 > this.slots.length) this.#resize();
    let firstFree = -1;
    for (const i of this.#probe(key)) {
      const s = this.slots[i];
      if (s === undefined) {
        this.slots[firstFree >= 0 ? firstFree : i] = key;
        this.count++;
        return;
      }
      if (s === DELETED) { if (firstFree < 0) firstFree = i; }
      else if (s === key) return;
    }
  }

  has(key) {
    for (const i of this.#probe(key)) {
      const s = this.slots[i];
      if (s === undefined) return false;
      if (s === key) return true;
    }
  }

  delete(key) {
    for (const i of this.#probe(key)) {
      const s = this.slots[i];
      if (s === undefined) return false;
      if (s === key) {
        this.slots[i] = DELETED;
        this.count--;
        return true;
      }
    }
  }

  #resize() {
    const old = this.slots.filter((s) => s !== undefined && s !== DELETED);
    this.slots = new Array(this.slots.length * 2).fill(undefined);
    this.count = 0;
    old.forEach((k) => this.add(k));
  }
}

const s = new OpenHashSet();
for (const w of "the quick brown fox jumps over the lazy dog".split(" ")) s.add(w);
s.delete("fox");
console.log(s.count, s.has("fox"), s.has("dog"));
module.exports = { OpenHashSet };
