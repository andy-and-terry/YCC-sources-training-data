// Minimal event emitter supporting on / once / off / emit.
class Emitter {
  #handlers = new Map();
  on(evt, fn) {
    (this.#handlers.get(evt) ?? this.#handlers.set(evt, new Set()).get(evt)).add(fn);
    return () => this.off(evt, fn);
  }
  once(evt, fn) {
    const wrapper = (...args) => { this.off(evt, wrapper); fn(...args); };
    return this.on(evt, wrapper);
  }
  off(evt, fn) { this.#handlers.get(evt)?.delete(fn); }
  emit(evt, ...args) { for (const fn of [...(this.#handlers.get(evt) ?? [])]) fn(...args); }
}

const bus = new Emitter();
bus.on("ping", (n) => console.log("on", n));
bus.once("ping", (n) => console.log("once", n));
bus.emit("ping", 1);
bus.emit("ping", 2);
