class Emitter {
  #h = new Map();
  on(e, f) { (this.#h.get(e) ?? this.#h.set(e, []).get(e)).push(f); return this; }
  off(e, f) { this.#h.set(e, (this.#h.get(e) ?? []).filter(x => x !== f)); return this; }
  once(e, f) { const w = (...a) => { this.off(e, w); f(...a); }; return this.on(e, w); }
  emit(e, ...a) { (this.#h.get(e) ?? []).slice().forEach(f => f(...a)); }
}
const em = new Emitter();
em.once('hi', x => console.log('once', x));
em.emit('hi', 1);
em.emit('hi', 2);
