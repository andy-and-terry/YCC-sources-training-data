type Handler<T> = (payload: T) => void;

class Emitter<Events extends Record<string, unknown>> {
  private handlers: { [K in keyof Events]?: Handler<Events[K]>[] } = {};

  on<K extends keyof Events>(name: K, h: Handler<Events[K]>) {
    (this.handlers[name] ??= []).push(h);
  }
  emit<K extends keyof Events>(name: K, payload: Events[K]) {
    this.handlers[name]?.forEach((h) => h(payload));
  }
}

const e = new Emitter<{ login: { user: string }; tick: number }>();
e.on("login", (p) => console.log("hi", p.user));
e.emit("login", { user: "bo" });
