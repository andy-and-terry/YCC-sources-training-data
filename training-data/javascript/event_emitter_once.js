class Emitter {
  #handlers = new Map();

  on(event, fn) {
    if (!this.#handlers.has(event)) this.#handlers.set(event, new Set());
    this.#handlers.get(event).add(fn);
    return () => this.off(event, fn);
  }

  once(event, fn) {
    const off = this.on(event, (...args) => { off(); fn(...args); });
    return off;
  }

  off(event, fn) { this.#handlers.get(event)?.delete(fn); }

  emit(event, ...args) {
    for (const fn of [...(this.#handlers.get(event) ?? [])]) fn(...args);
  }
}

const em = new Emitter();
em.once("ready", (v) => console.log("once:", v));
em.on("ready", (v) => console.log("always:", v));
em.emit("ready", 1);
em.emit("ready", 2);
