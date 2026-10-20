type Events = { login: { user: string }; logout: void };
class Emitter<E extends Record<string, any>> {
  private h: { [K in keyof E]?: ((p: E[K]) => void)[] } = {};
  on<K extends keyof E>(k: K, f: (p: E[K]) => void) { (this.h[k] ??= []).push(f); }
  emit<K extends keyof E>(k: K, p: E[K]) { this.h[k]?.forEach((f) => f(p)); }
}
const e = new Emitter<Events>();
e.on("login", (p) => console.log(p.user));
e.emit("login", { user: "ada" });
