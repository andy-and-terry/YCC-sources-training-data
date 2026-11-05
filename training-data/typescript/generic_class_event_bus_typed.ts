type Handlers<E> = { [K in keyof E]?: ((p: E[K]) => void)[] };

class Bus<E> {
  private h: Handlers<E> = {};
  on<K extends keyof E>(k: K, f: (p: E[K]) => void) { (this.h[k] ??= []).push(f); }
  emit<K extends keyof E>(k: K, p: E[K]) { this.h[k]?.forEach(f => f(p)); }
}

const bus = new Bus<{ login: string; count: number }>();
bus.on("login", u => console.log("hello", u));
bus.emit("login", "ann");
