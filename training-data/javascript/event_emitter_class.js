class Emitter {
  #h = new Map();
  on(e, f) { (this.#h.get(e) ?? this.#h.set(e, []).get(e)).push(f); return this; }
  emit(e, ...a) { (this.#h.get(e) ?? []).forEach(f => f(...a)); }
}
new Emitter().on('hi', n => console.log('hello', n)).emit('hi', 'ann');
