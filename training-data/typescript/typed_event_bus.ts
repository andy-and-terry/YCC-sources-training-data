type Events = {
  login: { user: string };
  logout: { user: string; reason?: string };
  tick: number;
};

class EventBus<M extends Record<string, unknown>> {
  private handlers: { [K in keyof M]?: Array<(p: M[K]) => void> } = {};

  on<K extends keyof M>(event: K, fn: (p: M[K]) => void): () => void {
    (this.handlers[event] ??= []).push(fn);
    return () => {
      this.handlers[event] = this.handlers[event]?.filter((h) => h !== fn);
    };
  }

  emit<K extends keyof M>(event: K, payload: M[K]): void {
    this.handlers[event]?.forEach((h) => h(payload));
  }
}

const bus = new EventBus<Events>();
const off = bus.on("login", ({ user }) => console.log("hello", user));
bus.on("tick", (n) => console.log("tick", n));
bus.emit("login", { user: "ada" });
off();
bus.emit("login", { user: "ignored" });
bus.emit("tick", 1);
